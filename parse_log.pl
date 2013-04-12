#!/usr/bin/env perl

package Apache::LogRegex::EFS;
use base 'Apache::LogRegex';

sub new {
    my $class = shift;

    my $log_format = '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"';
    return $class->SUPER::new($log_format);
}

sub rename_this_name {
    my ($self, $name) = @_;

    my %map_name = (
        '%{Referer}i'    => 'referer',
        '%{User-Agent}i' => 'useragent',
        '%t'             => 'timestamp',
        '%r'             => 'request',
        '%h'             => 'client',
        '%b'             => 'bytes',
        '%l'             => 'http_host',
        '%u'             => 'http_user',
        '%>s'            => 'status'
    );

    return $map_name{$name} || $name;
}

package DateTime::Format::Apache;
our $VERSION = '0.01';
use DateTime::Format::Builder
(
    parsers => {
        parse_datetime => {
            #params => [ qw( day month year hour minute second time_zone ) ],
            strptime => "[%d/%b/%Y:%H:%M:%S %z]",
        }
    }
);

###############################################################################

package main;
use FindBin;
use lib "$FindBin::Bin/./lib";

use Getopt::Long;
use IO::File;

my $filename;
my $cell;
my $server;
GetOptions(
    "filename=s"  => \$filename,
    "cell=s"      => \$cell,
    "efsserver=s" => \$efsserver,
);

my $file = $ARGV[0];
$filename ||= $file;

die "Specify a log file to parse" unless $file;
die "Specify --filename for logging" if $file eq '-';

use EFS::Log::Reports::Model::DB;
use EFS::Log::Reports::Schema::DB;

my $log = IO::File->new("< $file");
die "Can't open log file: $!" unless defined $log;

my $connect_info = EFS::Log::Reports::Model::DB->config->{connect_info};
my $schema = EFS::Log::Reports::Schema::DB->connect( $connect_info );
my $model = $schema->resultset('Access');

my $lr = Apache::LogRegex::EFS->new;
my $dtp = DateTime::Format::Apache->new;

$schema->txn_begin;
my $i;
while ( my %data = $lr->parse( $log->getline ) ) {
    die "Error parsing log file" unless %data;

    $data{filename} = $filename;
    $data{cell}      //= $cell;
    $data{efsserver} //= $efsserver;

    @data{ 'command', 'path', 'proto' } = split( / /, $data{'request'} );

    # Fall back to passing raw string if parse fails
    $data{timestamp} = $dtp->parse_datetime( $data{'timestamp'} ) || $data{timestamp};

    my $discard;
    ( $discard, @data{ 'metaproj', 'project', 'release' } ) = split( /\//, $data{'path'} );

    # TODO: Switch to filling an array and using populate
    $model->create( \%data );
    if ( $i++ % 500 ) {
        $schema->txn_commit;
        $schema->txn_begin;
    }
}
$schema->txn_commit;

$log->close;
