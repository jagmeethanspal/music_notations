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
# Module: Notations Mapping
# Creates a map/hash of Musical notes from different systems
# Western, French/Italian, Indian music notations
# Also Refer README.md
#
# Author: Jagmeet Singh Hanspal
#

use strict;
use warnings;
use Exporter;

our $VERSION = '1.00';

use lib ("./"); 
use music_notations;
our @ISA= qw( Exporter );

our @EXPORT = qw(%notation_map);

our %notation_map = ();

sub map_note_from_index {

    my ($system, $note, $index) = @_;
    

    if(exists($notation_map{$system}{$note})) {
	# Should not happen unless notations are overlapping
        printf("Mapping %s exists, skipping the mapping to %s\n", $note, $index);
        return;
    }

    # Create the conversion table / mapping
    $notation_map{$system}{$note}{sargam}{short} = $notation{sur}[$index];
    $notation_map{$system}{$note}{sargam}{notation} = $notation{sargam}[$index];
    $notation_map{$system}{$note}{sargam}{name} = $notation{sur_name}[$index];

    $notation_map{$system}{$note}{western_flat}{notation} = $notation{western_flat}[$index];
    $notation_map{$system}{$note}{western_flat}{name} = $notation{name}[$index];

    $notation_map{$system}{$note}{western_sharp}{notation} = $notation{western_sharp}[$index];
    $notation_map{$system}{$note}{western_sharp}{name} = $notation{name}[$index];

    $notation_map{$system}{$note}{solfege_flat}{notation} = $notation{solfege_flat}[$index];
    $notation_map{$system}{$note}{solfege_sharp}{notation} = $notation{solfege_sharp}[$index];
}

sub map_western_notes {
    # Initialize the Mapping of Western Notes mapping
    my $system="western_flat";
    for my $i (0..11) {
        my $n = $notation{western_flat}[$i];
        map_note_from_index($system, $n, $i);
    }
    $system="western_sharp";
    for my $i (0..11) {
        my $n = $notation{western_sharp}[$i];
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

    # Free-up any older mapping
    %notation_map = ();

    # Prepare the table/data of different systems
    map_western_notes();
    map_indian_notes();
    map_solfege_notes();
}

sub print_notes_mapping {
    my $system = "western_sharp";

    # Print the whole Octave
    printf("%-42s %-42s %-21s\n","Western","Sargam", "Solfege");
    printf("%-10s %-10s %-20s %-10s %-10s %-20s %-10s %-10s\n","Flat","Sharp","Name","Sur","Note","Name","Flat","Sharp");
    for my $note (@{$notation{$system}}) {
        if(exists($notation_map{$system}{$note})) {
            printf("%-10s %-10s %-20s %-10s %-10s %-20s %-10s %-10s\n", 
            $notation_map{$system}{$note}{western_flat}{notation}, $notation_map{$system}{$note}{western_sharp}{notation},
            $notation_map{$system}{$note}{western_flat}{name}, 
            $notation_map{$system}{$note}{sargam}{short}, $notation_map{$system}{$note}{sargam}{notation}, 
            $notation_map{$system}{$note}{sargam}{name}, $notation_map{$system}{$note}{solfege_flat}{notation},
            $notation_map{$system}{$note}{solfege_sharp}{notation});
        }
    }

    # Print the first note of the next Octave
    $system = "western_flat";
    if(exists($notation_map{$system}{C})) {
        printf("%-10s %-10s %-20s %-10s %-10s %-20s %-10s %-10s\n", 
        $notation_map{$system}{C}{western_flat}{notation}."+", $notation_map{$system}{C}{western_sharp}{notation}."+",
        "Octave", $notation_map{$system}{C}{sargam}{short}."+", 
        $notation_map{$system}{C}{sargam}{notation}."+", $notation_map{$system}{C}{sargam}{name}." Taar Saptak",
        $notation_map{$system}{C}{solfege_flat}{notation}."+", $notation_map{$system}{C}{solfege_sharp}{notation}."+");
    }

}

# Create the database of notes and conversions
map_notes();

sub check_system($) {
    my ($system) = @_;

    if(!exists($notation_map{$system}))
    {
        my $systems_supported;
        for my $key (keys %notation_map) {
            $systems_supported .= "\n$key";
        }
        print("\nMusical notation system \"$system\" not supported/found.\nChoose from: $systems_supported\n");
        return -1;
    }
}

sub check_note($$) {
    my ($system, $note) = @_;

    if(!exists($notation_map{$system}{$note}))
    {
        my $notes_supported;
        my $mapping = $notation_map{$system};
        for my $key (keys %{$mapping}) {
            $notes_supported .= "$key ";
        }
        print("\nMusical note \"$note\" not supported/found in \"$system\".\nChoose from: $notes_supported\n");
        return -1;
    }
}

# Musical Note conversion
sub convert_note($$$)
{
    my ($system, $note, $target) = @_;

    if(check_system($system) == -1) {
        return;
    }

    if(check_note($system, $note) == -1) {
        return;
    }

    if(check_system($target) == -1) {
        return;
    }

    my $mapping = $notation_map{$system}{$note}{$target};

    printf("\nConverting \"$system\" note \"$note\" to \"$target\":\n");
    for my $key (keys %{$mapping}) {
        printf("%-15s: %s\n", $key, $notation_map{$system}{$note}{$target}{$key});
    }
}

1;

