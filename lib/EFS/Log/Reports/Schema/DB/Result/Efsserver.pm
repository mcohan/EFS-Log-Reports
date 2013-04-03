use utf8;
package EFS::Log::Reports::Schema::DB::Result::Efsserver;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::Efsserver

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

=head1 TABLE: C<efsserver>

=cut

__PACKAGE__->table("efsserver");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 256

=head2 hosttype

  data_type: 'varchar'
  is_nullable: 0
  size: 8

=head2 disabled

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1
  size: [1,0]

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 256 },
  "hosttype",
  { data_type => "varchar", is_nullable => 0, size => 8 },
  "disabled",
  {
    data_type => "decimal",
    default_value => 0,
    is_nullable => 1,
    size => [1, 0],
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<efsserver_idx1>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("efsserver_idx1", ["name"]);

=head1 RELATIONS

=head2 efsserver_attrs

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::EfsserverAttr>

=cut

__PACKAGE__->has_many(
  "efsserver_attrs",
  "EFS::Log::Reports::Schema::DB::Result::EfsserverAttr",
  { "foreign.efsserver" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 efsserver_cells

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::EfsserverCell>

=cut

__PACKAGE__->has_many(
  "efsserver_cells",
  "EFS::Log::Reports::Schema::DB::Result::EfsserverCell",
  { "foreign.efsserver" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sslservers

Type: has_many

Related object: L<EFS::Log::Reports::Schema::DB::Result::Sslserver>

=cut

__PACKAGE__->has_many(
  "sslservers",
  "EFS::Log::Reports::Schema::DB::Result::Sslserver",
  { "foreign.efsserver" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/cEvotBHZGJmZBgFALJJ9A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
