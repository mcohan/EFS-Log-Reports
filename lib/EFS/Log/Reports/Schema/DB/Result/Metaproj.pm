use utf8;
package EFS::Log::Reports::Schema::DB::Result::Metaproj;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Metaproj

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

=head1 TABLE: C<metaproj>

=cut

__PACKAGE__->table("metaproj");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 8

=head2 groupname

  data_type: 'varchar'
  is_nullable: 0
  size: 8

=head2 owner_list

  data_type: 'varchar'
  is_nullable: 0
  size: 256

=head2 notify_list

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 noworldaccess

  data_type: 'decimal'
  is_nullable: 1
  size: [1,0]

=head2 distgroup

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 8 },
  "groupname",
  { data_type => "varchar", is_nullable => 0, size => 8 },
  "owner_list",
  { data_type => "varchar", is_nullable => 0, size => 256 },
  "notify_list",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "noworldaccess",
  { data_type => "decimal", is_nullable => 1, size => [1, 0] },
  "distgroup",
  { data_type => "varchar", is_nullable => 1, size => 8 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<metaproj_idx1>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("metaproj_idx1", ["name"]);

=head1 RELATIONS

=head2 grouprights

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Groupright>

=cut

__PACKAGE__->has_many(
  "grouprights",
  "EFS::Log::Reports::Schema::DB::Result::Groupright",
  { "foreign.metaproj" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 metaproj_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::MetaprojAttr>

=cut

__PACKAGE__->has_many(
  "metaproj_attrs",
  "EFS::Log::Reports::Schema::DB::Result::MetaprojAttr",
  { "foreign.metaproj" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 projects

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Project>

=cut

__PACKAGE__->has_many(
  "projects",
  "EFS::Log::Reports::Schema::DB::Result::Project",
  { "foreign.metaproj" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 userrights

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Userright>

=cut

__PACKAGE__->has_many(
  "userrights",
  "EFS::Log::Reports::Schema::DB::Result::Userright",
  { "foreign.metaproj" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5V33LqG2MzizWCyjpa1A8Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
