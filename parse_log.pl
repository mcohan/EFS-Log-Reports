#!/usr/bin/perl

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
          '%{Referer}i' => 'referer',
          '%{User-Agent}i' => 'useragent',
          '%t' => 'timestamp',
          '%r' => 'request',
          '%h' => 'client',
          '%b' => 'bytes',
          '%l' => 'http_host',
          '%u' => 'http_user',
          '%>s' => 'status'
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


package main;
use FindBin;
use lib "$FindBin::Bin/./lib";

use EFS::Log::Reports::Model::DB;
use EFS::Log::Reports::Schema::DB;

my $connect_info = EFS::Log::Reports::Model::DB->config->{connect_info};
my $schema = EFS::Log::Reports::Schema::DB->connect( $connect_info );

my $file = 'sample.txt';

my $lr = Apache::LogRegex::EFS->new;

my $log = IO::File->new("< $file");
die "Can't open log file: $!" unless defined $log;

my $model = $schema->resultset('Access');

while(my %data = $lr->parse($log->getline)) {
    $data{filename} = $file;
    die "Error parsing log file" unless %data;
    @data{'command', 'path', 'proto'} = split(/ /, $data{'request'});
    my $dtp = DateTime::Format::Apache->new;
    # Fall back to passing raw string if parse fails
    $data{timestamp} = $dtp->parse_datetime($data{'timestamp'}) || $data{timestamp};
    my $discard;
    ($discard, @data{'metaproj', 'project', 'release'}) = split(/\//, $data{'path'});
    $model->create( \%data );
}

$log->close;
