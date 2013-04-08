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

    # Apply filters...
    # Global search
    if ($search ne '') {
        my %sql_params = map { $_ => { 'LIKE' => "%$search%" }} @search_cols;
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

    # Sorting
    # TODO

    $c->forward('View::JSON');
}

sub data_chart :Local :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{json} = $self->_vega_bar;

    return $c->forward('View::JSON');

    my $body = <<EOF;
{
  "name": "arc",
  "width": 400,
  "height": 400,
  "padding": {"top":0, "bottom":0, "left":0, "right":0},
  "data": [
    {
      "name": "table",
      "values": [12, 23, 47, 6, 52, 19],
      "transform": [
        {"type": "pie", "value": "data"}
      ]
    }
  ],
  "scales": [
    {
      "name": "r",
      "type": "sqrt",
      "domain": {"data": "table", "field": "data"},
      "range": [20, 100]
    }
  ],
  "marks": [
    {
      "type": "arc",
      "from": {"data": "table"},
      "properties": {
        "enter": {
          "x": {"value": 200},
          "y": {"value": 200},
          "startAngle": {"field": "startAngle"},
          "endAngle": {"field": "endAngle"},
          "innerRadius": {"value": 20},
          "outerRadius": {"scale": "r"},
          "stroke": {"value": "#fff"}
        },
        "update": {
          "fill": {"value": "#ccc"}
        },
        "hover": {
          "fill": {"value": "pink"}
        }
      }
    }
  ]
}
EOF
    return $c->response->body( $body );

    my @data;
    my $type;

    my $search = $c->req->param('sSearch');
    
    my $access_rs = $c->model('DB::Access')->search();

    my @cols = qw( display_timestamp client http_host metaproj project release );
    my @search_cols = qw( timestamp client http_host metaproj project release );

    # TODO Apply user filtering

    # Apply filters...
    # Global search
    if ($search ne '') {
        my %sql_params = map { $_ => { 'LIKE' => "%$search%" }} @search_cols;
        #$access_rs = $access_rs->search({-or => \%params });
        $access_rs = $access_rs->search( { -or => \%sql_params });
    }

    while ( my $access = $access_rs->next ) {
        my $row = [ map { $access->$_ } @cols ];
        push @data, $row; 
    }

    $c->stash->{json} = deep_stringify(
        {
            aaData               => \@data,
        }
    );

    $c->forward('View::JSON');
}


sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->forward('View::TT');
}

sub _vega_bar :Private {
    my ( $self ) = @_;

    return {
    'width'  => 600,
    'height' => 300,
    'padding' => {
        'left'   => 30,
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
