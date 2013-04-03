use utf8;
package EFS::Log::Reports::Schema::DB::Result::Platform;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Platform

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

=head1 TABLE: C<platform>

=cut

__PACKAGE__->table("platform");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 backwards

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 emulates

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "backwards",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "emulates",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<platform_idx1>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("platform_idx1", ["name"]);

=head1 RELATIONS

=head2 backward

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Platform>

=cut

__PACKAGE__->belongs_to(
  "backward",
  "EFS::Log::Reports::Schema::DB::Result::Platform",
  { id => "backwards" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 emulate

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Platform>

=cut

__PACKAGE__->belongs_to(
  "emulate",
  "EFS::Log::Reports::Schema::DB::Result::Platform",
  { id => "emulates" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 platform_aliases

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::PlatformAlias>

=cut

__PACKAGE__->has_many(
  "platform_aliases",
  "EFS::Log::Reports::Schema::DB::Result::PlatformAlias",
  { "foreign.platform" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 platform_emulates

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Platform>

=cut

__PACKAGE__->has_many(
  "platform_emulates",
  "EFS::Log::Reports::Schema::DB::Result::Platform",
  { "foreign.emulates" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 platform_instances

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::PlatformInstance>

=cut

__PACKAGE__->has_many(
  "platform_instances",
  "EFS::Log::Reports::Schema::DB::Result::PlatformInstance",
  { "foreign.platform" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 platforms_backwards

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Platform>

=cut

__PACKAGE__->has_many(
  "platforms_backwards",
  "EFS::Log::Reports::Schema::DB::Result::Platform",
  { "foreign.backwards" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 platforms_build

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::PlatformBuild>

=cut

__PACKAGE__->has_many(
  "platforms_build",
  "EFS::Log::Reports::Schema::DB::Result::PlatformBuild",
  { "foreign.platform" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JTCT4lDOGte18Q82kIpJ4Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
