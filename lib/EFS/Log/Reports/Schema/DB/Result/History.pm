use utf8;
package EFS::Log::Reports::Schema::DB::Result::History;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EFS::Log::Reports::Schema::DB::Result::History

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

=head1 TABLE: C<history>

=cut

__PACKAGE__->table("history");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 parent

  data_type: 'integer'
  is_nullable: 1

=head2 command

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 request

  data_type: 'text'
  is_nullable: 0

=head2 starttime

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 logfile

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 authuser

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 efshost

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 efsversion

  data_type: 'varchar'
  is_nullable: 0
  size: 8

=head2 endtime

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 status

  data_type: 'integer'
  is_nullable: 1

=head2 pid

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1
  size: [6,0]

=head2 release

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 region

  data_type: 'varchar'
  is_nullable: 1
  size: 24

=head2 campus

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 location

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 cell

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 metaproj

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 project

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 install

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 releasealias

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 target

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 hosttype

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 stage

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 username

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 groupname

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 userid

  data_type: 'decimal'
  is_nullable: 1
  size: [12,0]

=head2 groupid

  data_type: 'decimal'
  is_nullable: 1
  size: [12,0]

=head2 platform

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 platforminstance

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 platformalias

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 platforminstancealias

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 platformbuild

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 backwards

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 emulates

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 fileserver

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 fileshare

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 fileqtree

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 filetype

  data_type: 'varchar'
  is_nullable: 1
  size: 4

=head2 efsserver

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 domain

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 business

  data_type: 'varchar'
  is_nullable: 1
  size: 24

=head2 division

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 pod

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 hostclass

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 cabinet

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 feature

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 parameter

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 ffrule

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 home

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "parent",
  { data_type => "integer", is_nullable => 1 },
  "command",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "request",
  { data_type => "text", is_nullable => 0 },
  "starttime",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "logfile",
  { data_type => "varchar", is_nullable => 1, size => 1024 },
  "authuser",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "efshost",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "efsversion",
  { data_type => "varchar", is_nullable => 0, size => 8 },
  "endtime",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "status",
  { data_type => "integer", is_nullable => 1 },
  "pid",
  {
    data_type => "decimal",
    default_value => 0,
    is_nullable => 1,
    size => [6, 0],
  },
  "release",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "region",
  { data_type => "varchar", is_nullable => 1, size => 24 },
  "campus",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "location",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "cell",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "metaproj",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "project",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "install",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "releasealias",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "target",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "hosttype",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "stage",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "username",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "groupname",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "userid",
  { data_type => "decimal", is_nullable => 1, size => [12, 0] },
  "groupid",
  { data_type => "decimal", is_nullable => 1, size => [12, 0] },
  "platform",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "platforminstance",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "platformalias",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "platforminstancealias",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "platformbuild",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "backwards",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "emulates",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "fileserver",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "fileshare",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "fileqtree",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "filetype",
  { data_type => "varchar", is_nullable => 1, size => 4 },
  "efsserver",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "domain",
  { data_type => "varchar", is_nullable => 1, size => 512 },
  "business",
  { data_type => "varchar", is_nullable => 1, size => 24 },
  "division",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "pod",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "hostclass",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "cabinet",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "feature",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "parameter",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "ffrule",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "home",
  { data_type => "varchar", is_nullable => 1, size => 8 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6OBhda84ZMvnapifgb5lEA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
