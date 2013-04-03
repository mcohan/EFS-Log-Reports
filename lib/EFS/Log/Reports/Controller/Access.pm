package EFS::Log::Reports::Controller::Access;
use Moose;
use namespace::autoclean;

use Stringify::Deep qw(deep_stringify);

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

EFS::Log::Reports::Controller::Access - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub data_dt :Local :Args(0) {
    my ( $self, $c ) = @_;

    my $count = 0;
    my $filtered_count= 0;
    my @data;

    my $offset = $c->req->param('iDisplayStart');
    my $limit  = $c->req->param('iDisplayLength');
    my $echo   = $c->req->param('sEcho');
    my $search = $c->req->param('sSearch');
    
    my $access_rs = $c->model('DB::Access')->search();

    my @cols = qw( display_timestamp client http_host metaproj project release );
    my @search_cols = qw( timestamp client http_host metaproj project release );

    # TODO Apply user filtering

    $count = $access_rs->count;
    use Data::Dumper;

    # Apply filters
    # Global search
    if ($search ne '') {
        my %sql_params = map { $_ => { 'LIKE' => "%$search%" }} @search_cols;
        #$access_rs = $access_rs->search({-or => \%params });
        $access_rs = $access_rs->search( { -or => \%sql_params });
        warn Dumper $access_rs->as_query;
    }

    $filtered_count = $access_rs->count;

    # Limit to displayed
    $access_rs = $access_rs->search({}, { rows => $limit, offset => $offset });

    while ( my $access = $access_rs->next ) {
        my $row = [ map { $access->$_ } @cols ];
        push @data, $row; 
    }

    $c->stash->{json} = deep_stringify(
        {
    #        sEcho                => int($echo),
            iTotalRecords        => int($count),
            iTotalDisplayRecords => int($filtered_count),
            aaData               => \@data,
        }
    );

    $c->forward('View::JSON');

}


sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->forward('View::TT');
}


=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
