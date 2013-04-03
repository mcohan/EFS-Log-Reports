use utf8;
package EFS::Log::Reports::Schema::DB::Result::Cabinet;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Cabinet

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

=head1 TABLE: C<cabinet>

=cut

__PACKAGE__->table("cabinet");

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

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "location",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 256 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<cabinet_idx1>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("cabinet_idx1", ["name"]);

=head1 RELATIONS

=head2 cabinet_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::CabinetAttr>

=cut

__PACKAGE__->has_many(
  "cabinet_attrs",
  "EFS::Log::Reports::Schema::DB::Result::CabinetAttr",
  { "foreign.cabinet" => "self.id" },
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


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:StDslnZ+/QYlGdCbnwGxfg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
