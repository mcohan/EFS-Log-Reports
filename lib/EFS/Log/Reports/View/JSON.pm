package EFS::Log::Reports::View::JSON;
use Moose;

use strict;
extends 'Catalyst::View::JSON';

=head1 NAME

EFS::Log::Reports::View::JSON - Catalyst JSON View

=head1 SYNOPSIS

See L<EFS::Log::Reports>

=head1 DESCRIPTION

Catalyst JSON View.

=head1 AUTHOR

root

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

before 'process' => sub {
    my($self, $c) = @_;

    $c->res->header('Access-Control-Allow-Origin' => '*');
};

1;
