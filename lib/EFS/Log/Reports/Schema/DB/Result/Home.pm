use utf8;
package EFS::Log::Reports::Schema::DB::Result::Home;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Home

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

=head1 TABLE: C<home>

=cut

__PACKAGE__->table("home");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 8

=head2 cell

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 destroyed

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 8 },
  "cell",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "destroyed",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<home_idx1>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("home_idx1", ["name"]);

=head1 RELATIONS

=head2 cell

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Cell>

=cut

__PACKAGE__->belongs_to(
  "cell",
  "EFS::Log::Reports::Schema::DB::Result::Cell",
  { id => "cell" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 home_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::HomeAttr>

=cut

__PACKAGE__->has_many(
  "home_attrs",
  "EFS::Log::Reports::Schema::DB::Result::HomeAttr",
  { "foreign.home" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cIbn7G0LTcG/U0rP5EmDxg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
