use utf8;
package EFS::Log::Reports::Schema::DB::Result::Access;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Access

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<access>

=cut

__PACKAGE__->table("access");

=head1 ACCESSORS

=head2 filename

  data_type: 'text'
  is_nullable: 1

=head2 request

  data_type: 'text'
  is_nullable: 1

=head2 useragent

  data_type: 'text'
  is_nullable: 1

=head2 referer

  data_type: 'text'
  is_nullable: 1

=head2 bytes

  data_type: 'integer'
  is_nullable: 1

=head2 status

  data_type: 'integer'
  is_nullable: 1

=head2 timestamp

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 efsserver

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 cell

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 metaproj

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 project

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 release

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 http_host

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 http_user

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 client

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 command

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 path

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 proto

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=cut

__PACKAGE__->add_columns(
  "filename",
  { data_type => "text", is_nullable => 1 },
  "request",
  { data_type => "text", is_nullable => 1 },
  "useragent",
  { data_type => "text", is_nullable => 1 },
  "referer",
  { data_type => "text", is_nullable => 1 },
  "bytes",
  { data_type => "integer", is_nullable => 1 },
  "status",
  { data_type => "integer", is_nullable => 1 },
  "timestamp",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "efsserver",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "cell",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "metaproj",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "project",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "release",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "http_host",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "http_user",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "client",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "command",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "path",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "proto",
  { data_type => "varchar", is_nullable => 1, size => 256 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2uN/DFR+3nCOPJYamSFEbQ

sub display_timestamp {
    my $self = shift;
    $self->timestamp->strftime("%d %b %Y %T") if $self->timestamp;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
