#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;
use Module::Install::Catalyst; # Complain loudly if you don't have
                               # Catalyst::Devel installed or haven't said
                               # 'make dist' to create a standalone tarball.

name 'EFS-Log-Reports';
all_from 'lib/EFS/Log/Reports.pm';

requires 'Catalyst::Runtime' => '5.80033';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
test_requires 'Test::More' => '0.88';
requires 'Catalyst::View::TT';
requires 'Catalyst::View::JSON';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Stringify::Deep';
requires 'DateTime';
requires 'Apache::RegexLog';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
