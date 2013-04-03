use utf8;
package EFS::Log::Reports::Schema::DB::Result::Userright;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Userright

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

=head1 TABLE: C<userrights>

=cut

__PACKAGE__->table("userrights");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 metaproj

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 role

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 8

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "metaproj",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "role",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 8 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<userrights_idx1>

=over 4

=item * L</metaproj>

=item * L</role>

=item * L</username>

=back

=cut

__PACKAGE__->add_unique_constraint("userrights_idx1", ["metaproj", "role", "username"]);

=head1 RELATIONS

=head2 metaproj

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Metaproj>

=cut

__PACKAGE__->belongs_to(
  "metaproj",
  "EFS::Log::Reports::Schema::DB::Result::Metaproj",
  { id => "metaproj" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nLYSmQT7Vs5ulUaEdOEUJQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
