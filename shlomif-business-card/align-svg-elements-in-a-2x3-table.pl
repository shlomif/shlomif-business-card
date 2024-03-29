#! /usr/bin/env perl
#
# Short description for svg-tab.pl
#
# Version 0.0.1
# Copyright (C) 2022 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

my $text = $_;

sub twice
{
    my ($arr) = @_;

    return [ map { ($_) x 2 } @$arr ];
}

sub replace
{
    my ( $label, $arr ) = @_;

    $text =~
s%(${label})="[^"]+"%$1="@{[(shift@$arr) // die qq#not enough in '$label'# ]}"%g;

    return;
}

my $sx = 40;
my $dx = 70;
my $x  = [ map { $sx + $dx * $_ } 0 .. 1 ];
$x = twice( [ map { @$x } 1 .. 3 ] );
my $sy = 130;
my $dy = 20;
my $y  = [ map { $sy + $dy * $_ } 0 .. 2 ];
$y = twice( [ map { ($_) x 2 } @$y ] );

replace( 'x', $x );
replace( 'y', $y );
die if @$x;
die if @$y;
$_ = $text;
