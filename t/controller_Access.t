use strict;
use warnings;
use Test::More;


use Catalyst::Test 'EFS::Log::Reports';
use EFS::Log::Reports::Controller::Access;

ok( request('/access')->is_success, 'Request should succeed' );
done_testing();
