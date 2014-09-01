all:
	gcc -o tax_class ncbitc.c -Wall
	wget -N ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdump.tar.gz
 	wget -N ftp://ftp.ncbi.nih.gov/pub/taxonomy//gi_taxid_nucl.dmp.gz
 	tar -xvf taxdump.tar.gz; gunzip gi_taxid_nucl.dmp.gz
	./tax_class -c
 	rm division.dmp 
 	rm gencode.dmp 
 	rm gc.prt 
 	rm merged.dmp 
 	rm delnodes.dmp 
 	rm citations.dmp 
 	rm readme.txt 
	sh generate_taxonomic_database.sh
	perl make_hashtable.pl
