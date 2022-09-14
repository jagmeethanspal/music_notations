#!/usr/bin/perl

#
# Perl Module
# Module: Music Notations
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
    
    sargam_file =>  ["Sa","kRe","Re","kGa","Ga","Ma","tMa","Pa","kDha","Dha","kNi","Ni"],

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
    ]
);

1;
