use utf8;
package EFS::Log::Reports::Schema::DB::Result::Install;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Install

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

=head1 TABLE: C<install>

=cut

__PACKAGE__->table("install");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 release

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 spaceused

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1
  size: [22,0]

=head2 filecount

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1
  size: [22,0]

=head2 dircount

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1
  size: [22,0]

=head2 linkcount

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1
  size: [22,0]

=head2 checksum

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 checktime

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1
  size: [22,0]

=head2 cloneof

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "release",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "spaceused",
  {
    data_type => "decimal",
    default_value => 0,
    is_nullable => 1,
    size => [22, 0],
  },
  "filecount",
  {
    data_type => "decimal",
    default_value => 0,
    is_nullable => 1,
    size => [22, 0],
  },
  "dircount",
  {
    data_type => "decimal",
    default_value => 0,
    is_nullable => 1,
    size => [22, 0],
  },
  "linkcount",
  {
    data_type => "decimal",
    default_value => 0,
    is_nullable => 1,
    size => [22, 0],
  },
  "checksum",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "checktime",
  {
    data_type => "decimal",
    default_value => 0,
    is_nullable => 1,
    size => [22, 0],
  },
  "cloneof",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<install_idx1>

=over 4

=item * L</release>

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("install_idx1", ["release", "name"]);

=head1 RELATIONS

=head2 cloneof

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Install>

=cut

__PACKAGE__->belongs_to(
  "cloneof",
  "EFS::Log::Reports::Schema::DB::Result::Install",
  { id => "cloneof" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 install_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::InstallAttr>

=cut

__PACKAGE__->has_many(
  "install_attrs",
  "EFS::Log::Reports::Schema::DB::Result::InstallAttr",
  { "foreign.install" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 install_auditstates

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::InstallAuditstate>

=cut

__PACKAGE__->has_many(
  "install_auditstates",
  "EFS::Log::Reports::Schema::DB::Result::InstallAuditstate",
  { "foreign.install" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 install_cellstates

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::InstallCellstate>

=cut

__PACKAGE__->has_many(
  "install_cellstates",
  "EFS::Log::Reports::Schema::DB::Result::InstallCellstate",
  { "foreign.install" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 installs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Install>

=cut

__PACKAGE__->has_many(
  "installs",
  "EFS::Log::Reports::Schema::DB::Result::Install",
  { "foreign.cloneof" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 release

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Release>

=cut

__PACKAGE__->belongs_to(
  "release",
  "EFS::Log::Reports::Schema::DB::Result::Release",
  { id => "release" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+w5hg5HHTmHL3WZYMPuoaQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
