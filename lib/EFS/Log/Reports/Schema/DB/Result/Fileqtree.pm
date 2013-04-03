use utf8;
package EFS::Log::Reports::Schema::DB::Result::Fileqtree;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Fileqtree

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

=head1 TABLE: C<fileqtree>

=cut

__PACKAGE__->table("fileqtree");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 fileshare

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "fileshare",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 128 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<fileqtree_idx1>

=over 4

=item * L</fileshare>

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("fileqtree_idx1", ["fileshare", "name"]);

=head1 RELATIONS

=head2 fileqtree_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::FileqtreeAttr>

=cut

__PACKAGE__->has_many(
  "fileqtree_attrs",
  "EFS::Log::Reports::Schema::DB::Result::FileqtreeAttr",
  { "foreign.fileqtree" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fileshare

Type: belongs_to

Related object: L<EFS::Log::Reports::Schema::DB::Result::Fileshare>

=cut

__PACKAGE__->belongs_to(
  "fileshare",
  "EFS::Log::Reports::Schema::DB::Result::Fileshare",
  { id => "fileshare" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BlNLno0K672Ylx5pLHUx8g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
