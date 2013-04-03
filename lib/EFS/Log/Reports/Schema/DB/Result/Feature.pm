use utf8;
package EFS::Log::Reports::Schema::DB::Result::Feature;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Feature

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

=head1 TABLE: C<feature>

=cut

__PACKAGE__->table("feature");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 value

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "value",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<feature_idx1>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("feature_idx1", ["name"]);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9NHb87z2qqWyftO3P0ZpIw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
