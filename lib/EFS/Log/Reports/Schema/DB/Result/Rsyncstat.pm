use utf8;
package EFS::Log::Reports::Schema::DB::Result::Rsyncstat;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Rsyncstat

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

=head1 TABLE: C<rsyncstats>

=cut

__PACKAGE__->table("rsyncstats");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 diststats

  data_type: 'integer'
  is_nullable: 0

=head2 starttime

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 endtime

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 status

  data_type: 'integer'
  is_nullable: 1

=head2 src_cell

  data_type: 'varchar'
  is_nullable: 0
  size: 256

=head2 dest_cell

  data_type: 'varchar'
  is_nullable: 0
  size: 256

=head2 metaproj

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 project

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 release

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 install

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 bytes_sent

  data_type: 'integer'
  is_nullable: 1

=head2 bytes_received

  data_type: 'integer'
  is_nullable: 1

=head2 bytes_rate

  data_type: 'varchar'
  is_nullable: 1
  size: 24

=head2 total_size

  data_type: 'integer'
  is_nullable: 1

=head2 speedup

  data_type: 'integer'
  is_nullable: 1

=head2 file_count

  data_type: 'integer'
  is_nullable: 1

=head2 file_xfer_count

  data_type: 'integer'
  is_nullable: 1

=head2 file_size

  data_type: 'integer'
  is_nullable: 1

=head2 file_xfer_size

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "diststats",
  { data_type => "integer", is_nullable => 0 },
  "starttime",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "endtime",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "status",
  { data_type => "integer", is_nullable => 1 },
  "src_cell",
  { data_type => "varchar", is_nullable => 0, size => 256 },
  "dest_cell",
  { data_type => "varchar", is_nullable => 0, size => 256 },
  "metaproj",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "project",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "release",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "install",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "bytes_sent",
  { data_type => "integer", is_nullable => 1 },
  "bytes_received",
  { data_type => "integer", is_nullable => 1 },
  "bytes_rate",
  { data_type => "varchar", is_nullable => 1, size => 24 },
  "total_size",
  { data_type => "integer", is_nullable => 1 },
  "speedup",
  { data_type => "integer", is_nullable => 1 },
  "file_count",
  { data_type => "integer", is_nullable => 1 },
  "file_xfer_count",
  { data_type => "integer", is_nullable => 1 },
  "file_size",
  { data_type => "integer", is_nullable => 1 },
  "file_xfer_size",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ip6lYm3TUKluF6tgEWp2Rg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
