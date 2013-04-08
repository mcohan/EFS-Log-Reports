package EFS::Log::Reports::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'EFS::Log::Reports::Schema::DB',
    
    connect_info => {
        dsn => 'dbi:mysql:efs',
        user => 'efs',
        password => 'efs',
        quote_char => '`',
        name_sep => '.',
    }
);

=head1 NAME

EFS::Log::Reports::Model::DB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<EFS::Log::Reports>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<EFS::Log::Reports::Schema::DB>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.6

=head1 AUTHOR

root

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
