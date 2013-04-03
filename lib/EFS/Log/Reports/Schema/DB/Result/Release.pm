use utf8;
package EFS::Log::Reports::Schema::DB::Result::Release;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Release

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

=head1 TABLE: C<release>

=cut

__PACKAGE__->table("release");

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

=head2 stage

  data_type: 'varchar'
  default_value: 'dev'
  is_nullable: 1
  size: 64

=head2 locked

  data_type: 'decimal'
  is_nullable: 1
  size: [1,0]

=head2 destroyed

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 packaged

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 uploaded

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 downloaded

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 noworldaccess

  data_type: 'decimal'
  is_nullable: 1
  size: [1,0]

=head2 distgroup

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 cloneof

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "project",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "stage",
  {
    data_type => "varchar",
    default_value => "dev",
    is_nullable => 1,
    size => 64,
  },
  "locked",
  { data_type => "decimal", is_nullable => 1, size => [1, 0] },
  "destroyed",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "packaged",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "uploaded",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "downloaded",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "noworldaccess",
  { data_type => "decimal", is_nullable => 1, size => [1, 0] },
  "distgroup",
  { data_type => "varchar", is_nullable => 1, size => 8 },
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

=head2 C<release_idx1>

=over 4

=item * L</project>

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("release_idx1", ["project", "name"]);

=head1 RELATIONS

=head2 cloneof

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Release>

=cut

__PACKAGE__->belongs_to(
  "cloneof",
  "EFS::Log::Reports::Schema::DB::Result::Release",
  { id => "cloneof" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 dependency_release_dependent_releases

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::DependencyRelease>

=cut

__PACKAGE__->has_many(
  "dependency_release_dependent_releases",
  "EFS::Log::Reports::Schema::DB::Result::DependencyRelease",
  { "foreign.dependent_release" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dependency_release_releases

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::DependencyRelease>

=cut

__PACKAGE__->has_many(
  "dependency_release_releases",
  "EFS::Log::Reports::Schema::DB::Result::DependencyRelease",
  { "foreign.release" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dependency_releasealias

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::DependencyReleasealia>

=cut

__PACKAGE__->has_many(
  "dependency_releasealias",
  "EFS::Log::Reports::Schema::DB::Result::DependencyReleasealia",
  { "foreign.dependent_release" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 installs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Install>

=cut

__PACKAGE__->has_many(
  "installs",
  "EFS::Log::Reports::Schema::DB::Result::Install",
  { "foreign.release" => "self.id" },
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

=head2 release_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::ReleaseAttr>

=cut

__PACKAGE__->has_many(
  "release_attrs",
  "EFS::Log::Reports::Schema::DB::Result::ReleaseAttr",
  { "foreign.release" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 releases

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Release>

=cut

__PACKAGE__->has_many(
  "releases",
  "EFS::Log::Reports::Schema::DB::Result::Release",
  { "foreign.cloneof" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OVyS+RLHJBT3MEK63YZE9A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
