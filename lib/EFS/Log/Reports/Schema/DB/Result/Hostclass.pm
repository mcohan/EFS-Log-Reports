use utf8;
package EFS::Log::Reports::Schema::DB::Result::Hostclass;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Hostclass

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

=head1 TABLE: C<hostclass>

=cut

__PACKAGE__->table("hostclass");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<hostclass_idx1>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("hostclass_idx1", ["name"]);

=head1 RELATIONS

=head2 hostclass_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::HostclassAttr>

=cut

__PACKAGE__->has_many(
  "hostclass_attrs",
  "EFS::Log::Reports::Schema::DB::Result::HostclassAttr",
  { "foreign.hostclass" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/Xod+AwPM1//QOyjrYeSeQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
