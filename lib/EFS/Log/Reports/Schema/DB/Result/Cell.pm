use utf8;
package EFS::Log::Reports::Schema::DB::Result::Cell;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Cell

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

=head1 TABLE: C<cell>

=cut

__PACKAGE__->table("cell");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 location

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 256

=head2 celltype

  data_type: 'varchar'
  is_nullable: 0
  size: 8

=head2 parentcell

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 hidden

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1
  size: [1,0]

=head2 disabled

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1
  size: [1,0]

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "location",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 256 },
  "celltype",
  { data_type => "varchar", is_nullable => 0, size => 8 },
  "parentcell",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "hidden",
  {
    data_type => "decimal",
    default_value => 0,
    is_nullable => 1,
    size => [1, 0],
  },
  "disabled",
  {
    data_type => "decimal",
    default_value => 0,
    is_nullable => 1,
    size => [1, 0],
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<cell_idx1>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("cell_idx1", ["name"]);

=head1 RELATIONS

=head2 cell_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::CellAttr>

=cut

__PACKAGE__->has_many(
  "cell_attrs",
  "EFS::Log::Reports::Schema::DB::Result::CellAttr",
  { "foreign.cell" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cells

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Cell>

=cut

__PACKAGE__->has_many(
  "cells",
  "EFS::Log::Reports::Schema::DB::Result::Cell",
  { "foreign.parentcell" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 efsserver_cells

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::EfsserverCell>

=cut

__PACKAGE__->has_many(
  "efsserver_cells",
  "EFS::Log::Reports::Schema::DB::Result::EfsserverCell",
  { "foreign.cell" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fileservers

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Fileserver>

=cut

__PACKAGE__->has_many(
  "fileservers",
  "EFS::Log::Reports::Schema::DB::Result::Fileserver",
  { "foreign.cell" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 homes

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Home>

=cut

__PACKAGE__->has_many(
  "homes",
  "EFS::Log::Reports::Schema::DB::Result::Home",
  { "foreign.cell" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 install_cellstates

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::InstallCellstate>

=cut

__PACKAGE__->has_many(
  "install_cellstates",
  "EFS::Log::Reports::Schema::DB::Result::InstallCellstate",
  { "foreign.cell" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 location

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Location>

=cut

__PACKAGE__->belongs_to(
  "location",
  "EFS::Log::Reports::Schema::DB::Result::Location",
  { id => "location" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 parentcell

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Cell>

=cut

__PACKAGE__->belongs_to(
  "parentcell",
  "EFS::Log::Reports::Schema::DB::Result::Cell",
  { id => "parentcell" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 projects

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Project>

=cut

__PACKAGE__->has_many(
  "projects",
  "EFS::Log::Reports::Schema::DB::Result::Project",
  { "foreign.cell" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 releasealias_cellstates

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::ReleasealiasCellstate>

=cut

__PACKAGE__->has_many(
  "releasealias_cellstates",
  "EFS::Log::Reports::Schema::DB::Result::ReleasealiasCellstate",
  { "foreign.cell" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ryNaJnhJ7YGNj5w4lCLhxg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
