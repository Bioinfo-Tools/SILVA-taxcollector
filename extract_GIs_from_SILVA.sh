#!/bin/bash

while read line
do
   ACC=`echo $line | tr ',' ' ' | awk '{print $1}'`
#   echo $ACC
   echo -n -e "$ACC,1," >> SILVA_to_TAXID.txt
   curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=${ACC}&rettype=fasta&retmode=xml" |\
   grep TSeq_gi |\
   cut -d '>' -f 2 |\
   cut -d '<' -f 1 |\
   tr -d "\n" >> SILVA_to_TAXID.txt
   echo >> SILVA_to_TAXID.txt
   sleep 0.10
done < SILVA_accessions.acs
