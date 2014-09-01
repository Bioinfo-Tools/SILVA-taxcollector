#!/bin/bash

echo "Downloading SILVA taxonomic information..."

OS=`uname`

if [ "$OS" == "Linux" -o "$OSTYPE" == "linux-gnu" ]; then
echo "Linux"
RELEASE_URL=$(wget -q -O -  ftp://ftp.ncbi.nih.gov/genbank/livelists/ | grep -o "\"ftp:[^\']*.gz\"" | tr -d "\"" | sort -n -t "." -k6,5 | tail -n 1)

# check version from name ...
echo "Last release is: "

LAST=`echo ${RELEASE_URL} |  grep -o "GbAccL[^\']*.gz"`

echo $LAST

wget -N ${RELEASE_URL}
fi

if [ "$OS" == "Darwin" -o "$OSTYPE" == "darwin"* ]; then
echo "MAC OSX"
LAST=`curl ftp://ftp.ncbi.nih.gov/genbank/livelists/ | grep -o "GbAccL[^\']*.gz" | sort -n -t "." -k3,2 | tail -n 1`
echo "Last release is: "
echo $LAST

curl -O ftp://ftp.ncbi.nih.gov/genbank/livelists/$LAST
fi

echo "Extracting data..."

name=`echo $LAST | sed -e 's/\.gz//g'`

gunzip -c $LAST > $name


mv $name SILVA_to_TAXID.txt

echo "Done!"
