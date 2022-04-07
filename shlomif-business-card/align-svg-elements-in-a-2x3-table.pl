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

my $sx = 40;
my $dx = 70;
my @x  = map { $sx + $dx * $_ } 0 .. 1;
@x = map { ($_) x 2 } map { @x } 1 .. 3;
my $sy = 130;
my $dy = 20;
my @y  = map { $sy + $dy * $_ } 0 .. 2;
@y = map { ($_) x 2 } map { ($_) x 2 } @y;
s%x="[^"]+"%x="@{[shift@x]}"%g;
s%y="[^"]+"%y="@{[shift@y]}"%g;
die if @x;
die if @y;
