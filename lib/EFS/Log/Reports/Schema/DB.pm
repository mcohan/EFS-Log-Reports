use utf8;
package EFS::Log::Reports::Schema::DB;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-01 20:25:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:F0NmiStxgs3hzZnadulEbQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);

 sub connection {
     my $self = shift;
     my $rv = $self->next::method( @_ );
     $rv->storage->sql_maker->quote_char('`');
     $rv->storage->sql_maker->name_sep('.');
     return $rv;
 }



1;
