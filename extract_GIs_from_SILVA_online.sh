#!/bin/bash

   ACC=$1
   result=""

for i in $(seq 1 1 10); do
if [ -z "$result" ]; then
   result=`curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=${ACC}&rettype=fasta&retmode=xml" |\
   grep TSeq_gi |\
   cut -d '>' -f 2 |\
   cut -d '<' -f 1`   
else
 echo $result;
 exit;  
fi
done
echo 155900
