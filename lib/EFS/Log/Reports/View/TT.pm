package EFS::Log::Reports::View::TT;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

EFS::Log::Reports::View::TT - TT View for EFS::Log::Reports

=head1 DESCRIPTION

TT View for EFS::Log::Reports.

=head1 SEE ALSO

L<EFS::Log::Reports>

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
