package DateTime::Format::FormInput;
our $VERSION = '0.01';
use DateTime::Format::Builder
(
   parsers => {
       parse_date => {
           #params => [ qw( day month year hour minute second time_zone ) ],
           strptime => "%m/%d/%Y",
       }
   }
);

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

has 'access_dt_cols' => (
    is      => 'ro',
    isa     => 'ArrayRef',
    default => sub { [
        qw( display_timestamp client http_host metaproj project release ) 
    ] }
);

has 'access_dt_sql_cols' => (
    is      => 'ro',
    isa     => 'ArrayRef',
    default => sub { [
        qw( timestamp client http_host metaproj project release ) 
    ] }
);

sub data_dt :Local :Args(0) {
    my ( $self, $c ) = @_;

    my $count = 0;
    my $filtered_count= 0;
    my @data;

    my $offset = $c->req->param('iDisplayStart');
    my $limit  = $c->req->param('iDisplayLength');
    my $echo   = $c->req->param('sEcho');

    my $access_rs = $c->model('DB::Access')->search();

    # Apply DT filtering
    if($c->req->param('iSortCol_0') ne '') {
        my @order;

        for my $i ( 0 .. $c->req->param('iSortingCols') - 1 ) {
            next
              unless $c->req->param( 'bSortable_' . $c->req->param( 'iSortCol_' . $i ) ) eq "true";
            my $sort_col = $self->access_dt_sql_cols->[ $c->req->param( 'iSortCol_' . $i ) ];
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
    $access_rs = $self->_handle_dt_search($access_rs, $c);

    # Report options
    $access_rs = $self->_handle_report_dates($access_rs, $c);

    $filtered_count = $access_rs->count;

    # Limit to displayed
    $access_rs = $access_rs->search({}, { rows => $limit, offset => $offset });

    while ( my $access = $access_rs->next ) {
        my $row = [ map { $access->$_ } @{$self->access_dt_cols} ];
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

sub data_chart :Local :CaptureArgs(1) {
    my ( $self, $c, $chart_type ) = @_;

    my %charts = (
        "access_meta" => sub {
            shift->_vega_bar_count_col( shift, 'metaproj' );
        },
        "access_proj" => sub {
            shift->_vega_bar_count_col( shift, \q{CONCAT(metaproj, '/', project)} );
        },

        "access_rel" => sub {
            shift->_vega_bar_count_col( shift, \q{CONCAT(metaproj, '/', project, '/', 'release')} );
        },

        "access_day" => sub {
            shift->_vega_bar_count_col( shift, \q{CAST(timestamp AS DATE)} );
        },

        "access_client" => sub {
            shift->_vega_bar_count_col( shift, 'client' );
        },
    );

    my $chart = $charts{$chart_type};
    $chart //= $charts{'access_client'};
     
    $c->stash->{json} = $chart->($self, $c);

    $c->forward('View::JSON');
}

sub _vega_bar_count_col :Private {
    my ( $self, $c, $col_name ) = @_;

    my $chart_json = $self->_vega_bar;
    my $access_rs = $c->model('DB::Access')->search(
        {},
        {
            select       => [ $col_name, { count => $col_name } ],
            as           => [ 'x',       'y' ],
            group_by     => [ $col_name ],
            result_class => 'DBIx::Class::ResultClass::HashRefInflator',
        }
    );

    # Global search
    $access_rs = $self->_handle_dt_search($access_rs, $c);

    # Report options
    $access_rs = $self->_handle_report_dates($access_rs, $c);

    my @values = $access_rs->all;
    $chart_json->{data}->[0]->{values} = \@values;

    return $chart_json;
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
            'ease'       => 'bounce',
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
            'values' => []
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
            'type' => 'linear', 
            'range' => 'height',
            'name'  => 'y',
            'nice'  => 1,
        }
    ],
  };
}

sub _handle_report_dates : Private {
    my ( $self, $access_rs, $c ) = @_;

    my $dfp = DateTime::Format::FormInput->new;
    eval {
        if ( my $start_date = $dfp->parse_date( $c->req->param('start_date') ) )
        {
            $start_date->set( hour => 0, minute => 0, second => 0 );
            $access_rs = $access_rs->search( { timestamp => { '>=' => $start_date } } );
        }
    };
    #warn "Could not parse start date: $@" if $@;

    eval {
        if ( my $end_date = $dfp->parse_date( $c->req->param('end_date') ) )
        {
            $end_date->set( hour => 11, minute => 59, second => 59 );
            $access_rs = $access_rs->search( { timestamp => { '<=' => $end_date } } );
        }
    };
    #warn "Could not parse end date: $@" if $@;

    return $access_rs;
}

sub _handle_dt_search : Private {
    my ( $self, $access_rs, $c ) = @_;

    my $search = $c->req->param('sSearch');
    if ($search ne '') {
        my %sql_params = map { $_ => { 'LIKE' => "%$search%" } } @{ $self->access_dt_sql_cols };
        $access_rs = $access_rs->search( { -or => \%sql_params });
    }

    return $access_rs;
}

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
