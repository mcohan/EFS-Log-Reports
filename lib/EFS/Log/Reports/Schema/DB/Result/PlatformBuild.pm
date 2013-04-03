use utf8;
package EFS::Log::Reports::Schema::DB::Result::PlatformBuild;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::PlatformBuild

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

=head1 TABLE: C<platform_build>

=cut

__PACKAGE__->table("platform_build");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 platform

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 kernel

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 initrd

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 options

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "platform",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "kernel",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "initrd",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "options",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<platform_build_idx1>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("platform_build_idx1", ["name"]);

=head1 RELATIONS

=head2 platform

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Platform>

=cut

__PACKAGE__->belongs_to(
  "platform",
  "EFS::Log::Reports::Schema::DB::Result::Platform",
  { id => "platform" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 platform_build_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::PlatformBuildAttr>

=cut

__PACKAGE__->has_many(
  "platform_build_attrs",
  "EFS::Log::Reports::Schema::DB::Result::PlatformBuildAttr",
  { "foreign.platformbuild" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/V342pkqL1/i1sTmN6hnUw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
