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

#
# Perl Module
# Module: Music Notations
# Western, French/Italian, Indian music notations
# Also Refer README.md
#
# Author: Jagmeet Singh Hanspal
#


package music_notations;

use strict;
use warnings;
use Exporter;

our $VERSION = '1.00';

our @ISA= qw( Exporter );

our @EXPORT = qw(%notation);

our %notation = (
    western => ["C","Db","D","Eb","E","F","Gb","G","Ab","A","Bb","B"],

    name => [
        "Unison",
        "Minor Second",
        "Major Second",
        "Minor Third",
        "Major Third",
        "Perfect Fourth",
        "Augmented Fourth",
        "Perfect Fifth",
        "Minor Sixth",
        "Major Sixth",
        "Minor Seventh",
        "Major Seventh"
    ],
    
    sargam =>  ["S","r", "R","g", "G","m","M", "P","d", "D","n", "N"],
    # Use only for representation and index, not for file-name
    
    sur =>  ["Sa","kRe","Re","kGa","Ga","Ma","tMa","Pa","kDha","Dha","kNi","Ni"],

    sur_name => [
        "Shadaj",
        "Komal Rishab",
        "Shuddh Rishab",
        "Komal Gandhar",
        "Shuddh Gandhar",
        "Shuddh Madhyam",
        "Tivra Madhyam",
        "Pancham",
        "Komal Dhaivat",
        "Shuddh Dhaivat",
        "Komal Nishad",
        "Shuddh Nishad"
    ],

    solfege_flat  => ["Do","Ra","Re","Me","Mi","Fa","Se","Sol","Le","La","Te","Ti"],
    solfege_sharp => ["Do","Di","Re","Ri","Mi","Fa","Fi","Sol","Si","La","Li","Ti"],

);

1;
