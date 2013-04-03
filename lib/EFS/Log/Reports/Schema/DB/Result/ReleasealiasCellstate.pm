use utf8;
package EFS::Log::Reports::Schema::DB::Result::ReleasealiasCellstate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::ReleasealiasCellstate

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

=head1 TABLE: C<releasealias_cellstate>

=cut

__PACKAGE__->table("releasealias_cellstate");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 releasealias

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 cell

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 target

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "releasealias",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "cell",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
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

=head2 C<releasealias_cellstate_idx1>

=over 4

=item * L</releasealias>

=item * L</cell>

=back

=cut

__PACKAGE__->add_unique_constraint("releasealias_cellstate_idx1", ["releasealias", "cell"]);

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

=head2 releasealia

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Releasealia>

=cut

__PACKAGE__->belongs_to(
  "releasealia",
  "EFS::Log::Reports::Schema::DB::Result::Releasealia",
  { id => "releasealias" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+W7hBMHD4hpofsihX4q0zg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
