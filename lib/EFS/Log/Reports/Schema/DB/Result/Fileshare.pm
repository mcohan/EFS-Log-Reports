use utf8;
package EFS::Log::Reports::Schema::DB::Result::Fileshare;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Fileshare

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

=head1 TABLE: C<fileshare>

=cut

__PACKAGE__->table("fileshare");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 fileserver

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 filetype

  data_type: 'varchar'
  is_nullable: 0
  size: 4

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "fileserver",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "filetype",
  { data_type => "varchar", is_nullable => 0, size => 4 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<fileshare_idx1>

=over 4

=item * L</fileserver>

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("fileshare_idx1", ["fileserver", "name"]);

=head1 RELATIONS

=head2 fileqtrees

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Fileqtree>

=cut

__PACKAGE__->has_many(
  "fileqtrees",
  "EFS::Log::Reports::Schema::DB::Result::Fileqtree",
  { "foreign.fileshare" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fileserver

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Fileserver>

=cut

__PACKAGE__->belongs_to(
  "fileserver",
  "EFS::Log::Reports::Schema::DB::Result::Fileserver",
  { id => "fileserver" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 fileshare_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::FileshareAttr>

=cut

__PACKAGE__->has_many(
  "fileshare_attrs",
  "EFS::Log::Reports::Schema::DB::Result::FileshareAttr",
  { "foreign.fileshare" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Fia5MXu0HZVQyal+QotSIg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
