#! /usr/bin/perl

#Pre requisites
# These are working on 02/19/13
use lib "/home/royc/perl5/lib/perl5/"; # BioPerl location
#use lib "/home/royc/lib/ensembl.perl.zpi/ensembl/modules"; #ensembl packages

=head1 Ligamer Assembler

  This script will automatically create ligamers.

=head2 Contact information

  Script made by Christian Roy, Umass Medical School
  christian.roy@umassmed.edu

=cut

use strict; # To help wtih variable control
use warnings; # To help me catch mistakes

use Bio::EnsEMBL::Registry; # To load remote EnsEMBL Registry
use Bio::EnsEMBL::Slice; # To retreave sequences from EnsEMBL registry
use Bio::DB::Fasta; # BioPerl tool to retreave sequnce from local FastA file
use Bio::SeqFeature::Primer; # BioPerl Tool for Tm normalization
use Cwd; # To retreave current working directory information

my $dir = getcwd; # Assign current working directory to scalar
my $timestamp = localtime(); # Grab the time at script start

## Variables
my  (
  $file_input, # Name of specified input file
  $output_file, # Name of file to print results too
  $species, # The species to grab from Ensembl
  $strand, # The strand to grab for ligamer sequences
  $working_sequence, # The slice sequence variable
  $line_counter, #Keep track of stepping through input file
  @arguments, # Keep track of input arguments
  $fa_reference, # Fill if using a local FASTA Reference file
  $chr, # Obvious
  $coordinates, # Interim variable for splitting UCSC
  $start, # obvious
  $end, # Obvious
  $gene, # target gene name
  $lig_location, # Ligamer prime variable
  $target_prime, # Broad variable to define ligamer type - see man
  $UCSCcoordinates, # Obvious
  $pcrsequence, # fill with appropriate PCR sequence for terminal oligos
  $barcode, # Fill will barcode for sequence between regions of comp.
  $note_line, # Fill with notes for a ligamer query
  $three_prime_PCR_sequence, # Fill with three prime PCR sequence
  $five_prime_PCR_sequence, # Fill with five prime PCR sequence
  $lig_joiner_code, # Internal varialbe for assembling ligamers see man
  $set, # Move set assembly information input to output file
  );

#Variables with Defaults
my $verbose=0; # Verbose loading of ensembl databases
my $db_version=62; # Default database version for ensembl database loading
my $temp="58"; # Defalt temp for Tm normalization
my $salt="0.05"; # Default salt concetration for Tm calculation in M
my $lig_conc="0.00000025"; # Defeult ligamer conc for Tm calc in M
my $man_print=0; # for printing manual information
my $help_print=0; # For printing help informatio to HTML file
my $ligamer_name=0; # Internal variable for sequental numbering of ligamers
my $remote=0; # set to 1 for ensembl database loading
my $control_length=20; # Default length for control variables in nt
my $plname=$0; # assign $plname scalar to script name (for help printing)

#Print Usage information if nothing is entered at commandline
if (@ARGV==0) {system "pod2text $0 | less"; die}

=head2 Usage


  -hp = Print HTML POD data for scriptname
  -mp = Print and view Manual POD data for scriptname
  -i [File] = File Input
  -o [File] = File output
  -v [#] = Verbose for Ensembl loading
  -d [#] = data_base version for Ensembl loading
  -t [#] = Temp in degrees celcius
  -salt [#] = Salt concentration for Tm in mM
  -lig_conc [#] = Ligamer concentration for Tm in nM
  -c [#} = Minimum length for Control ligamers (default=20)

=cut
## Finish message if run with no arguments

#Parse the command line
while(@ARGV>0)
{
  @arguments = @ARGV;  #Store the command line for printing later

  my $next_arg=shift(@ARGV);

  if ($next_arg eq "-hp") { # Do you want to print HTML POD Data?
    $help_print=1;
    }
  if ($next_arg eq "-mp") { # Do you want to print a manual?
    $man_print=1;
    }
  if ($next_arg eq "-i") { # What is the name of the input file?
    $file_input = shift @ARGV;
   }
  if ($next_arg eq "-f") { #n Name of the fasta file your sequences are in?
    $fa_reference = shift @ARGV ;
    }
  if ($next_arg eq "-r") { # Do you want to fetch sequences from ensembl?
    $remote = 1
    }
  if ($next_arg eq "-o") { # Name of output file
    $output_file = shift(@ARGV);
    }
  if ($next_arg eq "-v") { # Do you want to see the ensembl load data?
    $verbose = shift @ARGV;
    }
  if ($next_arg eq "-d") { # What version of ensembl do you want to use?#
    $db_version = shift @ARGV;
    }
  if ($next_arg eq "-t") { # What temperature in degrees C do you want to norm ?
    $temp = shift @ARGV;
    }
  if ($next_arg eq "-salt") { # Salt concentration for Tm calculations?
    $salt = shift @ARGV ;
    $salt = $salt / 1000; # from micro Molar to Molar
    }
  if ($next_arg eq "-lig_conc") { # Concentration for Tm calculations?
    $lig_conc=shift@ARGV;
    $lig_conc = $lig_conc / 1000000000; # nM to M
    }
  if ($next_arg eq "-c") { # What length would you like (min) for control ligs?
    $control_length = shift @ARGV ;
    $control_length = $control_length-1
    }
} ## Finish Parsing the command line

###################### POD HELP SUBROUTINE CALLS################################
my $scriptname=$0;
podhelp( $scriptname, $help_print, $man_print, $dir);
##################### POD HTML Subroutine CALLS#################################

#################### open the ensembl registry#################################
my $db;
if ($fa_reference) {
  $db = Bio::DB::Fasta->new($fa_reference);
  }

if ($remote==1) {
  $db = ensembl_database($verbose, $db_version)
  }
################################################################################
#open the output file
open (OUT, '>'.$output_file) || die "The output file could not be created.\n";
## Print the headers
print OUT
# Start with general assembler information
">Source Program\t",$dir,$0,"\n".
">Date Run \t$timestamp \n".
">Arguments entered \t", "@arguments"," \n".
">Input filename \t$file_input\n".
">Output filename \t$output_file\n".
">Control Seq Length \t$control_length plus 1\n".
">Normalization temperature \t$temp\n".
##### now all on 1 line print the ligmaer-specific information
">Gene\t". #1
"Ligamer_Number\t". #2
"Species\t". #3
"Strand\t". #4
"Ligamer Joiner Code\t". #5
"Target Prime\t". #6
"UCSC coordinates\t". #7
"PCR Used\t". #8
"Barcode Used\t". #9
"Total Query span\t". #10
"Five Prime Sequence\t". #11
"5 Prime Length\t". #12
"Five Prime Tm\t".
"3 Prime Sequence\t".
"3 Prime Length\t".
"3 Prime Tm\t".
#"Ligamer Identifier\t".
"Ligamer Sequence\t".
"Ligamer Length\t".
"Notes\t".
"Set\t".
"\n";
################################################################################
## open the input file
open (INPUT, $file_input) || die "The file $file_input couldn't be opened.\n";
###############################################################################

#################read and analyze each line of the input file #################
while (my $line=<INPUT>) { ## starting brace to read through csv

  if ($line=~/^#/){next} #skips comments
  if ($line=~/^>/){print OUT $line; next} #skips and trans.these lines
  if ($line=~/^~/){$line=~s/~//;chomp $line; $gene=$line;} # find gene identifier
  $gene=~s/[\s]+//g;
  if ($line=~/^\@/){chomp $line;$note_line=$line;next} #store notes

  chomp $line;

  if ($line=~/^PCR-Primer-5'-/g) { #Find the 5 adaptor
    $five_prime_PCR_sequence=$line;
    $five_prime_PCR_sequence=~s/PCR-Primer-5'-//;
    $five_prime_PCR_sequence=~s/[\s]+//g;
    print OUT ">5_pcr\t".$five_prime_PCR_sequence."\n";
    next
    }

  if ($line=~/^PCR-Primer-3'-/) {## find the 3 adaptor
    $three_prime_PCR_sequence=$line;
    $three_prime_PCR_sequence=~s/PCR-Primer-3'-//;
    $three_prime_PCR_sequence=~s/[\s]+//g;
    print OUT ">3_pcr\t".$three_prime_PCR_sequence."\n";
    next
    }

  if ($line=~/^</) {#ligamer query lines start with a '<'
    unless ($note_line) {$note_line=" ";}

    my $lig_joiner_code;
    my $slice_sequence;

    $line_counter++;

     (
     $gene,
     $species,
     $strand,
     $lig_location,
     $target_prime,
     $UCSCcoordinates,
     $barcode,
     $set
     ) = parse_the_line($line);

    $lig_location = uc $lig_location;

    # Parse the ligamer query line
    ($chr, $start, $end)= parse_coordinates($UCSCcoordinates);


    my $target_seq_length = ($end-$start);

############ Get genomic slice from ensembl registry ###############
    if ($remote==1) {
      $slice_sequence =
        get_genomic_sequence
        (
        $chr,
        $start,
        $end,
        $species,
        $db,
        )
      }
#####################################################################

############ Get the genomic slice from local Fasta #################
    if ($fa_reference) {
      #$chr="chr".$chr;
      my $obj = $db -> get_Seq_by_id($chr);
      $slice_sequence = $obj -> subseq ($start => $end);
      }
####################################################################

#### get the correct orientation
    my ($working_sequence) =
      revcom_slice_based_on_strand
        (
         $strand,
         $slice_sequence
         );

  # Get the T5 end
    my ($T5_seq, $T5_tm, $T5_seq_length)=
      obtain_T5_tm_sequence
    (
    $working_sequence,
    $temp,
    $lig_location,
    $control_length,
    $salt,$lig_conc
    );
  # Get the T3 end
    my ($T3_seq, $T3_tm, $T3_seq_length) =
      obtain_T3_tm_sequence
    (
    $working_sequence,
    $temp,
    $lig_location,
    $control_length,
    $salt,
    $lig_conc
    );

  #start to build your working HASH
    my %common =
      (
      working_sequence    => $working_sequence,
      temp      => $temp,
      UCSCcoordinates   => $UCSCcoordinates,
      UCSC_chr      => $chr,
      UCSC_start    => $start,
      UCSC_end      => $end,
      gene      => $gene,
      ligamer_name    => $ligamer_name,
      species       => $species,
      strand      => $strand,
      target_prime    => $target_prime,
      five_prime_PCR_sequence => $five_prime_PCR_sequence,
      three_prime_PCR_sequence  => $three_prime_PCR_sequence,
      barcode     => $barcode,
      target_seq_length   => $target_seq_length,
      seed      => $control_length,
      T3_seq      => $T3_seq,
      T3_tm     => $T3_tm,
      T3_seq_length   => $T3_seq_length,
      T5_seq      => $T5_seq,
      T5_tm     => $T5_tm,
      T5_seq_length   => $T5_seq_length,
      notes     => $note_line,
      set     =>$set,
      );

    if ($lig_location eq "T" && $target_prime eq "5") { #Terminal 5 targeted
      #Advance the ligamer number
      $ligamer_name++;
      $common{ligamer_name} = $ligamer_name;
      # Add to the hash table
      $lig_joiner_code = "T-5";
      $common {lig_joiner_code} = $lig_joiner_code;
      my %lig_results = Terminal_5(%common);
      my %final = ligamer_piece_joiner(%lig_results);
      my %bed_output = %final;
      output (%final);
      };

    if ($lig_location eq "TC" &&  $target_prime eq "5") {# Grab the internal
      $ligamer_name++;
      $common{ligamer_name} = $ligamer_name;
      $lig_joiner_code = "T-C-5-I";
      $common {lig_joiner_code} = $lig_joiner_code;
      my %lig_results = Terminal_5(%common);

      my %final_internal =
         ligamer_piece_joiner
             (%lig_results);

      my $working_sequence = $lig_results{working_sequence};
      my $T5_seq_length = $lig_results{T5_seq_length};

      # Now grab the sequence inside of the control
      $working_sequence = $common{working_sequence};
      my $T5_ctrl_length = $common{T5_seq_length};
      $common{T5_ctrl_length} = $T5_ctrl_length;
      $working_sequence = substr ($working_sequence,$T5_ctrl_length);
      $lig_location = "IC";
      ($T5_seq, $T5_tm, $T5_seq_length) =
      obtain_T5_tm_sequence
    (
    $working_sequence,
    $temp,
    $lig_location,
    $salt,
    $lig_conc
    );

      $common{working_sequence} = $working_sequence;
      $common{T5_seq} = $T5_seq;
      $common{T5_tm} = $T5_tm;
      $common{T5_seq_length} = $T5_seq_length;
      $ligamer_name++;
      $common{ligamer_name}= $ligamer_name;
      $lig_joiner_code="T-C-5-T";
      $common {lig_joiner_code}= $lig_joiner_code;
      %lig_results = Terminal_5 (%common);
      my %final = ligamer_piece_joiner(%lig_results);
      output (%final_internal);
      output (%final);
      }

    if ($lig_location eq "T" && $target_prime eq "3") {
      $ligamer_name++;
      $common{ligamer_name} = $ligamer_name;
      $lig_joiner_code = "T-3";
      $common {lig_joiner_code} = $lig_joiner_code;
      my %lig_results = Terminal_3 (%common);
      my %final = ligamer_piece_joiner (%lig_results);
      my %bed_output = %final;
      output (%final);
      };

    if ($lig_location eq "TC" &&  $target_prime eq "3") {
      #Grab the control
      $ligamer_name++;
      $common{ligamer_name} = $ligamer_name;
      $lig_joiner_code = "T-C-3-I";
      $common {lig_joiner_code} = $lig_joiner_code;
      my %lig_results = Terminal_3    (%common);
      my %final_internal = ligamer_piece_joiner (%lig_results);
      # Grab the sequence internal of the control
      $working_sequence = $common{working_sequence};
      my $T3_ctrl_length = $common{T3_seq_length};
      $common{T3_ctrl_length} = $T3_ctrl_length;
      $T3_seq_length = $common{T3_seq_length};
      $working_sequence = substr ($working_sequence,0, $T3_ctrl_length);
      $lig_location = "IC";
      ($T3_seq, $T3_tm, $T3_seq_length) =
      obtain_T3_tm_sequence
        (
        $working_sequence,
        $temp,
        $lig_location
         );

      $common{working_sequence} = $working_sequence;
      $common{T3_seq} = $T3_seq;
      $common{T3_tm} = $T3_tm;
      $common{T3_seq_length} = $T3_seq_length;
      $common{bed_start} = $start;
      $common{bed_end} = $end;
      $ligamer_name++;
      $common{ligamer_name} = $ligamer_name;
      $lig_joiner_code = "T-C-3-T";
      $common {lig_joiner_code} = $lig_joiner_code;
      %lig_results = Terminal_3 (%common);
      my %final = ligamer_piece_joiner (%lig_results);
      output (%final);
      output (%final_internal);
      };

    if ($lig_location eq "I" && $target_seq_length>60) {
      $ligamer_name++;
      $common{ligamer_name} = $ligamer_name;

        if ($lig_location eq "I" && $target_prime eq "C") {
        $lig_joiner_code = "I-L-C";
        $common {lig_joiner_code} = $lig_joiner_code;
        my %lig_results = (%common);
        my %final = ligamer_piece_joiner(%lig_results);
        $final{pcrsequence} = "";
        my %bed_output = %final;
        output (%final);
        }

        if ($lig_location eq "I" && $target_prime eq "N") {
        $lig_joiner_code = "I-L";
        $common {lig_joiner_code} = $lig_joiner_code;
        my %lig_results = (%common);
        my %final = ligamer_piece_joiner(%lig_results);
        $final{pcrsequence} = "";
        my %bed_output = %final;
        output (%final);
        #my %bed_final = prep_bed (%bed_output);
        }
      }

    if ($lig_location eq "I" && $target_seq_length<=60) {
      $ligamer_name++;
      $common{ligamer_name} = $ligamer_name;
      $lig_joiner_code = "I-S";
      $common {lig_joiner_code} = $lig_joiner_code;
      my %lig_results = obtain_short_interal_tm (%common);
      my %final = ligamer_piece_joiner (%lig_results);
      $final{pcrsequence} = "";
      my %bed_output = %final;
      output (%final);
      #my %bed_final = prep_bed (%bed_output);
      };

    }## matching brace for ligamer data lines

  else {next};
}## Matching brace for csv file input test
####### END LIGAMERS ASSEMBLY PORTION

close OUT;
close INPUT;
print "Program Finished.\n";
exit;

####### END MAJOR WORK OF PROGRAM !!
###############################################################################
#### Begin Subroutine section of program.
sub Terminal_5 {
my %results = (@_);

my $T3_seq = "";
my $T3_tm = "";
my $T3_seq_length = "";


$results {T3_seq} = $T3_seq;
$results {T3_tm} = $T3_tm;
$results {T3_seq_length} = $T3_seq_length;

return %results;
}
################################################################################
##
################################################################################
sub Terminal_3 {
my %results = (@_);

my $T5_seq="";
my $T5_tm="";
my $T5_seq_length="";

$results {T5_seq} = $T5_seq;
$results {T5_tm} = $T5_tm;
$results {T5_seq_length} = $T5_seq_length;

return %results;
}
################################################################################

################ BEGIN Subroutine for short slices #############################
sub obtain_short_interal_tm {

my %results = (@_);
my $working_sequence = $results{working_sequence};

my $working_sequence_tm_obj=
Bio::SeqFeature::Primer -> new(-seq=>$working_sequence);
my $T5_tm = $working_sequence_tm_obj->
  Tm
    (
    -salt => $salt,
    -oligo => $lig_conc
    );

$T5_tm=substr($T5_tm,0,5);
my $T5_seq = $working_sequence;

$results{working_sequence} = $working_sequence;
$results{T5_seq} = $T5_seq;
$results{T5_tm} = $T5_tm;

return (%results);
}
################################################################################

################################################################################
sub output { my %results=(@_);

print OUT $results{gene     },"\t"; # 0
print OUT $results{ligamer_name   },"\t"; # 1
print OUT $results{species    },"\t"; # 2
print OUT $results{strand   },"\t"; # 3
print OUT $results{lig_joiner_code  },"\t"; # 4
print OUT $results{target_prime   },"\t"; # 5
print OUT $results{UCSCcoordinates  },"\t"; # 6
print OUT $results{pcrsequence    },"\t"; # 7
print OUT $results{barcode    },"\t"; # 8
print OUT $results{target_seq_length  },"\t"; # 9
print OUT $results{T5_seq   },"\t"; # 10
print OUT $results{T5_seq_length  },"\t"; # 11
print OUT $results{T5_tm    },"\t"; # 12
print OUT $results{T3_seq   },"\t"; # 13
print OUT $results{T3_seq_length  },"\t"; # 14
print OUT $results{T3_tm    },"\t"; # 15
print OUT $results{ligamer    },"\t"; # 16
print OUT $results{warning    };  #
print OUT $results{ligamer_length },"\t"; # 17
print OUT $results{notes    },"\t"; # 18
print OUT $results{set      },"\t"; # 19


#Commented on 022013
#if ( defined $results{T5_ctrl_length} ) {
#  print OUT $results{  T5_ctrl_length  },"\t";
#  }

#if ( defined $results{T3_ctrl_length} ) {
#  print OUT $results{  T3_ctrl_length  },"\t";
#  }

print OUT "\n";

}
################################################################################

######BEGIN Subroutine to parse csv file into variables ########################
sub parse_the_line {

my $line = shift(@_);

my  (
  $gene,
  $ligamer_name,
  $species,
  $strand,
  $lig_location,
  $target_prime,
  $UCSCcoordinates,
  $barcode,
  $set
  )
  = split /\t/ , $line ;

$gene=~s/^<//;
print "Gene - $gene\n";
print "Ligmamer name - $ligamer_name\n";
print "species - $species\n";
print "strand - $strand\n";
print "lig_location - $lig_location\n";
print "target_prime - $target_prime\n";
print "UCSC - $UCSCcoordinates\n";
print "barcode - [$barcode]\n";
print "Set - [$set]\n";

if ($barcode=~/ /){$barcode=~s/ //}  ## GO HERE!

$gene=~s/<//;

return
  (
  $gene,
  $species,
  $strand,
  $lig_location,
  $target_prime,
  $UCSCcoordinates,
  $barcode,
  $set
  );

}

######END Subroutine to parse csv file into variables ############

######BEGIN Subroutine to parse genomic coordnates into variables ############
sub parse_coordinates {

my $input=shift(@_);

my ($chr,$coordinates)  =split /\:/,$input;

my ($start,$end)  =split /\-/,$coordinates;
#$chr=~s/chr//;  # I have comment out this to behave with local fasta files!

$start=~s/\,//g;
$end=~s/\,//g;

return ($chr, $start, $end);

}
######END Subroutine to parse genomic coordnates into variables ################

######Subroutine to make revcom depending on strand annoation###################
sub revcom_slice_based_on_strand {

my ($strand, $slice_sequence) = @_;

#if the strand is positive - make the reverse compliment
$strand=lc($strand);

if ($strand eq 'plus') {
  $working_sequence = reverse($slice_sequence);
  $working_sequence =~ tr/ACGTacgt/TGCAtgca/;
  }
# if the strand is minus - do nothing
if ($strand eq 'minus') {
  $working_sequence = $slice_sequence;
  }

return $working_sequence
}

###### END SUBROUTINE revcom_slice_based_on_strand ####################


################ BEGIN Subroutine to obtained only 5' end of working sequence##
sub obtain_T5_tm_sequence {

my $working_sequence = shift (@_);
my $temp = shift (@_);
my $lig_location = shift (@_);
my $control_length=shift (@_);
my $salt=shift (@_);
my $lig_conc=shift (@_);
my $working_sequence_length = length ($working_sequence);
my $T5_seq_length;

if ($lig_location eq "TC") {$T5_seq_length=$control_length};
if ($lig_location eq "T") {$T5_seq_length=19};
if ($lig_location eq "I") {$T5_seq_length=19};

my $T5_tm=0;
my $T5_seq;
my $T5_seq_out;

while($T5_tm < $temp)
  {
  $T5_seq_length++;
  print ".";
  $T5_seq=substr $working_sequence,0, $T5_seq_length;
  my $T5_seq_primer=
  Bio::SeqFeature::Primer ->
    new
    (
    -seq=>$T5_seq
    );
$T5_tm = $T5_seq_primer ->
    Tm
    (
    -salt=>$salt,
    -oligo=>$lig_conc
    );
  $T5_tm=substr($T5_tm,0,5);
  if ($T5_seq_length eq $working_sequence_length) {last;}
  if ($T5_tm>=$temp)
    {
    $T5_seq_out = $T5_seq;
    print "\n";
    last
    }

  if ($T5_seq_length eq 33)
    {
    $T5_seq_out=$T5_seq;
    print "\n";
    print STDERR "Warning: ".
    "Assembly at line $. T5 side cut".
    " off due to low Tm \n";
    last
    }
  elsif ($T5_tm<=$temp){next}
  }
return ($T5_seq_out, $T5_tm, $T5_seq_length);
}

################ BEGIN Subroutine to obtained only 3' end of working sequence##
sub obtain_T3_tm_sequence {

my $working_sequence = shift (@_);
my $temp = shift (@_);
my $lig_location = shift (@_);
my $control_length=shift (@_);
my $salt=shift (@_);
my $lig_conc=shift (@_);
my $working_sequence_length = length ($working_sequence);
my $T3_seq_length;

if ($lig_location eq "TC") {$T3_seq_length=(-$control_length)};
if ($lig_location eq "T") {$T3_seq_length=(-19)};
if ($lig_location eq "I") {$T3_seq_length=(-19)};

my $T3_tm=0;
my $T3_seq;
my $T3_seq_out;

while ($T3_tm < $temp )
  {
  print ".";
  $T3_seq_length--;
  $T3_seq=
  substr $working_sequence, $T3_seq_length;
  my $T3_seq_primer=
  Bio::SeqFeature::Primer ->
    new
    (
   -seq=>$T3_seq
    );
  $T3_tm = $T3_seq_primer ->
    Tm
    (
    -salt=>$salt,
    -oligo=>$lig_conc
     );
  $T3_tm=substr($T3_tm,0,5);
  if ($T3_seq_length eq (-$working_sequence_length)) {last;}
  if ($T3_seq_length<(-80)){die}
  if ($T3_tm>=$temp)
    {
    $T3_seq_out=$T3_seq;
    print "\n";
    last
    }

  if ($T3_seq_length eq (-33))
    {
    $T3_seq_out=$T3_seq;
    print "\n";
    print STDERR "Warning: ".
    "Assembly at line $. T3 side cut".
    " off due to low Tm \n";
    last
    }
  if ($T3_tm<$temp){next}
  }
return ($T3_seq_out, $T3_tm, $T3_seq_length);
}

################ END Subroutine to obtained only 3' end of working sequence####

################ BEGIN Subroutine to joined pieces of ligamer   #########
sub ligamer_piece_joiner{

my %results = @_;

my $lig_joiner_code = $results{lig_joiner_code};
my $T5_seq    = $results{T5_seq};
my $barcode   = $results{barcode};
my $T3_seq    = $results{T3_seq};
my $pcrsequence;
my $short_sequence=$T5_seq;
my $ligamer;
my $ligamer_length;
my $warning=" ";
my $Phos_mod_code="\/5Phos\/";

if ($lig_joiner_code eq "T-5")
  {
  $pcrsequence=$results{three_prime_PCR_sequence};
  $ligamer = join ("",$Phos_mod_code, $T5_seq, $barcode,$pcrsequence);
  $ligamer_length = length $ligamer;
  $ligamer_length = $ligamer_length-7;
  }

if ($lig_joiner_code eq "T-C-5-I")
  {
  $pcrsequence=$results{three_prime_PCR_sequence};
  $ligamer = join ("",$Phos_mod_code,$short_sequence);
  $ligamer_length = length $ligamer;
  $ligamer_length = $ligamer_length-7;
  }

if ($lig_joiner_code eq "T-C-5-T")
  {
  $pcrsequence=$results{three_prime_PCR_sequence};
  $ligamer = join ("",$Phos_mod_code, $T5_seq, $barcode, $pcrsequence);
  $ligamer_length = length $ligamer;
  $ligamer_length = $ligamer_length-7;
  }

if ($lig_joiner_code eq "T-3")
  {
  $pcrsequence=$results{five_prime_PCR_sequence};
  $ligamer = join ("",$pcrsequence,$barcode,$T3_seq);
  $ligamer_length = length $ligamer;
  }

if ($lig_joiner_code eq "T-C-3-I")
  {
  $pcrsequence=$results{five_prime_PCR_sequence};
  $ligamer = join ("",$Phos_mod_code,$T3_seq);
  $ligamer_length = length $ligamer;
  $ligamer_length = $ligamer_length-7;
  }

if ($lig_joiner_code eq "T-C-3-T")
  {
  $pcrsequence=$results{five_prime_PCR_sequence};
  $ligamer = join ("",$pcrsequence,$barcode,$T3_seq);
  $ligamer_length = length $ligamer;
  }

if ($lig_joiner_code eq "I-S")
  {
  $ligamer = join ("",$Phos_mod_code,$short_sequence);
  $ligamer_length = length $ligamer;
  $ligamer_length = $ligamer_length-7;
  }

if ($lig_joiner_code eq "I-L")
  {
  $ligamer = join ("",$Phos_mod_code,$T5_seq,$barcode,$T3_seq);
  $ligamer_length = length $ligamer;
  $ligamer_length = $ligamer_length-7;
  }

if ($lig_joiner_code eq "I-L-C")
  {
  $ligamer = join ("",$Phos_mod_code,$T5_seq,$barcode,$T3_seq);
  $ligamer_length = length $ligamer;
  $ligamer_length = $ligamer_length-7;
  }

if ($ligamer_length > 60)
  {
  print STDERR
  "Warning! The ligamer from input file data line $.".
  " has a length greater than 60!\n";
  };


$results{pcrsequence}   = $pcrsequence;
$results{ligamer}   = $ligamer;
$results{ligamer_length}  = $ligamer_length;
$results{warning}   = $warning;

return %results;

}
################################################################################

################################################################################
## Load the latest Ensembl Registry
sub ensembl_database{

my $verbose=shift@_;
my $db_version=shift@_;

my $registry = 'Bio::EnsEMBL::Registry';
print "Beginning to login to Ensembl database version $db_version.\n";
$registry->load_registry_from_db
  (
  -host => 'ensembldb.ensembl.org',
  -user => 'anonymous',
  -db_version => $db_version,
  -verbose => $verbose,
  );

print "Done loading ensembl database.\n";
return $registry;
}
################################################################################

################ BEGIN Subroutine to obtained get genomic sequence slice #######
sub get_genomic_sequence {

my ($chr, $start, $end, $species, $db ) = @_;

my $slice_adaptor = $db->get_adaptor( $species, 'Core', 'Slice');

$chr=~s/^chr//;

my $slice = $slice_adaptor->
  fetch_by_region
    (
    'chromosome',
    $chr,
    $start,
    $end,
    );

my $slice_sequence = ($slice->seq);

return $slice_sequence;
}
################ END Subroutine to obtained get genomic sequence slice ######
################################################################################
################ BEGIN Subroutine to PROVIDE POD HELP DATA ######
sub podhelp {

my $scriptname=   shift@_;
my $help_print=   shift@_;
my $man_print=    shift@_;
my $perlname=$scriptname;
my $htmlname=$scriptname;
my $manname=$scriptname;

if ($help_print eq 1)
  {
  $htmlname =~ s/\.pl/\.html/;
  system "pod2html $perlname --title=$perlname --outfile=$htmlname";
  print "\n\t$htmlname printed in cwd.\n\n";
  exit
  }

if ($man_print eq 1)
  {
  $manname =~ s/\.pl/\.man/;
  system "pod2man $perlname $manname";
  print "\n\t$manname printed in $dir.\n\n";
  system "man -l $manname|less";
  exit
  }
}
################ END Subroutine to PROVIDE POD HELP DATA ######