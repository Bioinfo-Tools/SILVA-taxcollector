# !/usr/bin/perl -w

############################################################
#
#SILVA-taxcollector
#Attaches taxonomic information to BLAST and SOAP2 results
#Results must be in tabular format (-m 8 or -m 6)
#By: Raquel Dias
#Contact: raquel.dias@ufl.edu
#University of Florida
#Department of Microbiology and Cell Science
#
############################################################
use DB_File;
use Getopt::Std;
use File::Basename;
use Storable;
use Storable qw(store retrieve freeze thaw dclone);

unless ( open( FILE, "SILVA_to_TAXID.txt" ) ) {
print "Error: Unable to open classification results file \"SILVA_to_TAXID.txt\". You can download this using the running the script generate_taxonomic_database.sh\n";
exit;
}

print "making hash table...\n";
my %hash;
while (<FILE>)
{
   chomp;
   @records = split /,.*,/;
   $hash{$records[0]} = $records[1];
   #print "$records[0] $hash{$records[0]}\n";
   #store \%hash, 'hashtable.db';
   
}
   
   
store(\%hash, 'hashtable.db');


print "Hash table done.\n";


