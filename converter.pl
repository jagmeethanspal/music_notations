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
# Usage: ./converter.pl
# Output: Conversion of Musical notes from different systems
#
# Author: Jagmeet Singh Hanspal
#

use strict;
use warnings;

use lib ("./"); 
use music_notations;

our %notation_map = ();

sub map_note_from_index {

    my ($system, $note, $index) = @_;
    

    if(exists($notation_map{$note})) {
	# Should not happen unless notations are overlapping
        printf("Mapping %s exists, skipping the mapping to %s\n", $note, $index);
        return;
    }

    # Create the conversion table / mapping
    $notation_map{$system}{$note}{sargam}{notation} = $notation{sargam}[$index];
    $notation_map{$system}{$note}{sargam}{name} = $notation{sur}[$index];
    $notation_map{$system}{$note}{sargam}{full_name} = $notation{sur_name}[$index];

    $notation_map{$system}{$note}{western}{notation} = $notation{western}[$index];
    $notation_map{$system}{$note}{western}{name} = $notation{name}[$index];

    $notation_map{$system}{$note}{solfege_flat}{notation} = $notation{solfege_flat}[$index];
    $notation_map{$system}{$note}{solfege_sharp}{notation} = $notation{solfege_sharp}[$index];
}

sub map_western_notes {
    # Initialize the Mapping of Western Notes mapping
    my $system="western";
    for my $i (0..11) {
        my $n = $notation{western}[$i];
        map_note_from_index($system, $n, $i);
    }
}

sub map_indian_notes {
    # Initialize the Mapping of Indian Sur (Hindustani)
    my $system="sargam";
    for my $i (0..11) {
        my $n = $notation{sargam}[$i];
        map_note_from_index($system, $n, $i);
    }
}

sub map_solfege_notes {
    # Initialize the Mapping of Solfege (Flat)
    my $system="solfege_flat";
    for my $i (0..11) {
        my $n = $notation{solfege_flat}[$i];
        map_note_from_index($system, $n, $i);
    }
    # Initialize the Mapping of Solfege (Sharp)
    $system="solfege_sharp";
    for my $i (0..11) {
        my $n = $notation{solfege_sharp}[$i];
        map_note_from_index($system, $n, $i);
    }
}

sub map_notes {
    # Prepare the table/data of different systems
    map_western_notes();
    map_indian_notes();
    map_solfege_notes();
}

sub print_notes_mapping {
    my $system = "western";

    # Print the whole Octave
    printf("%-31s %-42s %-21s\n","Western","Sargam", "Solfege");
    printf("%-10s %-20s %-10s %-10s %-20s %-10s %-10s\n","Note","Name","Note","Sur","Name","Flat","Sharp");
    for my $note (@{$notation{$system}}) {
        if(exists($notation_map{$system}{$note})) {
            printf("%-10s %-20s %-10s %-10s %-20s %-10s %-10s\n", 
            $notation_map{$system}{$note}{western}{notation}, $notation_map{$system}{$note}{western}{name}, 
            $notation_map{$system}{$note}{sargam}{notation}, $notation_map{$system}{$note}{sargam}{name}, 
            $notation_map{$system}{$note}{sargam}{full_name}, $notation_map{$system}{$note}{solfege_flat}{notation},
            $notation_map{$system}{$note}{solfege_sharp}{notation});
        }
    }

    # Print the first note of the next Octave
    $system = "western";
    if(exists($notation_map{$system}{C})) {
        printf("%-10s %-20s %-10s %-10s %-20s %-10s %-10s\n", 
        $notation_map{$system}{C}{western}{notation}."+", "Octave", $notation_map{$system}{C}{sargam}{notation}."+", 
        $notation_map{$system}{C}{sargam}{name}."+", $notation_map{$system}{C}{sargam}{full_name}." Taar Saptak",
        $notation_map{$system}{C}{solfege_flat}{notation}."+", $notation_map{$system}{C}{solfege_sharp}{notation}."+");
    }
}

# Create the database of notes and conversions
map_notes();

# Print the notes and conversion table for different systems
print_notes_mapping();

