#!/usr/bin/perl

#
# Copyright 2022 Jagmeet Singh Hanspal
#
# Licensed under the Apache License, Version 2.0 (the "License"); 
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#   http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, 
# software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
# See the License for the specific language governing permissions and 
# limitations under the License.
#

# Perl subroutines
# Module: Notations Converter
# Western, French/Italian, Indian music notations
# Also Refer README.md
#
# Usage: ./convert.pl [All]
# [All] Output: Conversion of Musical notes from different systems
# Without [All], any specified notation system is converted to/from.
#
# Author: Jagmeet Singh Hanspal
#

use strict;
use warnings;

use lib ("./"); 
use notation_mapping;


my $user_requests = 0;
sub user_conversion_request() {

    my $system;
    my $note;
    my $target;

    my $r = ++$user_requests;

    do {
        print "\n[$r] Enter your Musical Notation System: ";
        $system = <>;
        chomp($system);
    } while (check_system($system) == -1);

    do {
        print "\n[$r] Which Musical Note do you want to convert: ";
        $note = <>;
        chomp($note);
    } while (check_note($system, $note) == -1);

    do {
        print "\n[$r] Enter the Musical Notation system you require: ";
        $target = <>;
        chomp($target);
    } while (check_system($target) == -1);

    convert_note($system, $note, $target);
}

if(defined $ARGV[0]) {
    if($ARGV[0] eq "All") {
        # Print the notes and conversion table for different systems
        print_notes_mapping();
    } else {
        print "Usage: ./convert.pl [All]\n";
    }
    exit;
}

while(1) {
    user_conversion_request();
}

