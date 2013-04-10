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
    my @sql_cols = qw( timestamp client http_host metaproj project release );

    # Apply DT filtering
    if($c->req->param('iSortCol_0') ne '') {
        my @order;

        for my $i ( 0 .. $c->req->param('iSortingCols') ) {
            next
              unless $c->req->param( 'bSortable_' . $c->req->param( 'iSortCol_' . $i ) ) eq "true";
            my $sort_col = @sql_cols[ $c->req->param( 'iSortCol_' . $i ) ];
            my $sort_dir = $c->req->param( 'sSortDir_' . $i );
            next
              if $sort_col eq ''
                  or $sort_dir eq '';
            push @order, { "-$sort_dir" => $sort_col };
        }
        $access_rs = $access_rs->search( {}, { order_by => \@order } )
          if @order;
    }


    $count = $access_rs->count;

    # Apply filters...
    # Global search
    if ($search ne '') {
        my %sql_params = map { $_ => { 'LIKE' => "%$search%" }} @sql_cols;
        #$access_rs = $access_rs->search({-or => \%params });
        $access_rs = $access_rs->search( { -or => \%sql_params });
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
            sEcho                => int($echo),
            iTotalRecords        => int($count),
            iTotalDisplayRecords => int($filtered_count),
            aaData               => \@data,
        }
    );

    $c->forward('View::JSON');
}

sub data_chart :Local :Args(1) {
    my ( $self, $c, $chart_type ) = @_;


    $c->stash->{json} = $self->_vega_bar;

    $c->forward('View::JSON');
}

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->forward('View::TT');
}

sub _vega_bar :Private {
    my ( $self ) = @_;

    return {
    'width'  => 450,
    'height' => 225,
    'padding' => {
        'left'   => 40,
        'right'  => 10,
        'top'    => 10,
        'bottom' => 30
    },
    'marks' => [
        {
            'from'       => { 'data' => 'table' },
            'type'       => 'rect',
            'properties' => {
                'hover'  => { 'fill' => { 'value' => 'red' } },
                'update' => { 'fill' => { 'value' => 'steelblue' } },
                'enter'  => {
                    'y' => {
                        'scale' => 'y',
                        'field' => 'data.y'
                    },
                    'width' => {
                        'band' => 1,
                        'scale'  => 'x',
                        'offset' => -1
                    },
                    'x' => {
                        'scale' => 'x',
                        'field' => 'data.x'
                    },
                    'y2' => {
                        'value' => 0,
                        'scale' => 'y'
                    }
                }
            }
        }
    ],
    'data' => [
        {
            'name'   => 'table',
            'values' => [
                {
                    'y' => 20,
                    'x' => 'proj1', 
                },
                {
                    'y' => 200,
                    'x' => 'proj2',
                },
            ]
        }
    ],
    'axes' => [
        {
            'scale' => 'x',
            'type'  => 'x'
        },
        {
            'scale' => 'y',
            'type'  => 'y'
        }
    ],
    'scales' => [
        {
            'domain' => {
                'data'  => 'table',
                'field' => 'data.x'
            },
            'range' => 'width',
            'name'  => 'x',
            'type'  => 'ordinal'
        },
        {
            'domain' => {
                'data'  => 'table',
                'field' => 'data.y'
            },
            'range' => 'height',
            'name'  => 'y',
            'nice'  => 1,
        }
    ],
  };

}


=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
