use utf8;
package EFS::Log::Reports::Schema::DB::Result::Releasealia;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Releasealia

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

=head1 TABLE: C<releasealias>

=cut

__PACKAGE__->table("releasealias");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 project

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 target

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "project",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "target",
  { data_type => "varchar", is_nullable => 0, size => 128 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<releasealias_idx1>

=over 4

=item * L</project>

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("releasealias_idx1", ["project", "name"]);

=head1 RELATIONS

=head2 dependency_releasealias

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::DependencyReleasealia>

=cut

__PACKAGE__->has_many(
  "dependency_releasealias",
  "EFS::Log::Reports::Schema::DB::Result::DependencyReleasealia",
  { "foreign.releasealias" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 project

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Project>

=cut

__PACKAGE__->belongs_to(
  "project",
  "EFS::Log::Reports::Schema::DB::Result::Project",
  { id => "project" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 releasealias_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::ReleasealiasAttr>

=cut

__PACKAGE__->has_many(
  "releasealias_attrs",
  "EFS::Log::Reports::Schema::DB::Result::ReleasealiasAttr",
  { "foreign.releasealias" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 releasealias_cellstates

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::ReleasealiasCellstate>

=cut

__PACKAGE__->has_many(
  "releasealias_cellstates",
  "EFS::Log::Reports::Schema::DB::Result::ReleasealiasCellstate",
  { "foreign.releasealias" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+JpgcMkKQky7xAs+kNqXWg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
