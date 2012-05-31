#!/bin/bash
#The DuKode Studio 2012
#author ilias koen
#desc: Download and process a landsat tile by providing path and row. 
#ex .getTilewithPathandRow 010 010 

#################################################################################
args=("$@")
NUM1=$#
NUM2=2
TILEPATH=${args[0]}
TILEROW=${args[1]}


if [ $NUM1 -eq $NUM2 ]; then
	echo ""
	echo "You entered Path:"$1" and Row:" $2
	echo ""
else 
	echo ""
	echo "You must enter path and row as arguments only."
	echo ""
	echo "ex. getTimewithPathAndRow 10 10 "
	echo ""
	exit 0 	
fi

#create path for download and select imagery
#path for WRS2 
#ftp://ftp.glcf.umd.edu/glcf/Landsat/WRS2/p010/r010/
TILEDOWNLOADPATH="ftp://ftp.glcf.umd.edu/glcf/Landsat/WRS2/p"$TILEPATH"/r"$TILEROW"/"

echo $TILEDOWNLOADPATH

if [ -d "tmp" ]; then 
    rm tmp/*
else
	mkdir tmp
fi
echo "Created tmp directory"
read -p "Press [Enter] key to start lookup FTP directory..."
#################################################################################


wget -rq -nd --no-parent -P tmp $TILEDOWNLOADPATH 
wget -r -nd --no-parent -P tmp $TILEDOWNLOADPATH 
cd tmp/
FILES=*
TILEFILESARRAY=(`echo $FILES`)
for i in ${TILEFILESARRAY[@]}; do
	echo "$i"
done
cd .. 
rm tmp/*
echo "listed directory files"
read -p "Press [Enter] key to download the first file"
#################################################################################


#################################################################################
###### IMAGE SELECTION ????? 
# how are we going to do the selection from the list I am not sure yet. 
#################################################################################


#################################################################################
TILEDOWNLOADPATH="ftp://ftp.glcf.umd.edu/glcf/Landsat/WRS2/p"$TILEPATH"/r"$TILEROW"/${TILEFILESARRAY[0]}/*"
#wget -rq -nd --no-parent -P tmp $TILEDOWNLOADPATH 
wget -r -nd --no-parent -P tmp $TILEDOWNLOADPATH 
echo "finished directory files download"
read -p "Press [Enter] key to continue"
#################################################################################

#################################################################################
cd tmp/
FILES=*
TILEFILESARRAY=(`echo $FILES`)

RESULT="found"
for i in ${TILEFILESARRAY[@]}; do
	echo "$i"
	character="B10"
	#B10
	if [[ "$i" == *B10* ]]
	then
	  echo "It's there!"
	  BAND10=$i
	fi
	#B20
	if [[ "$i" == *B20* ]]
	then
	  echo "It's there!"
	  BAND20=$i
	fi
	#B30
	if [[ "$i" == *B30* ]]
	then
	  echo "It's there!"
	  BAND30=$i
	fi
	#B40
	if [[ "$i" == *B40* ]]
	then
	  echo "It's there!"
	  BAND40=$i
	fi
	#B50
	if [[ "$i" == *B50* ]]
	then
	  echo "It's there!"
	  BAND50=$i
	fi
	#B60
	if [[ "$i" == *B60* ]]
	then
	  echo "It's there!"
	  BAND60=$i
	
	#B61
	if [[ "$i" == *B61* ]]
	then
	  echo "It's there!"
	  BAND61=$i
	fi
	#B62
	if [[ "$i" == *B62* ]]
	then
	  echo "It's there!"
	  BAND62=$i
	fi
	#B70
	if [[ "$i" == *B70* ]]
	then
	  echo "It's there!"
	  BAND70=$i
	fi
	#B80
	if [[ "$i" == *B80* ]]
	then
	  echo "It's there!"
	  BAND80=$i
	fi	
done

echo "$BAND10"
echo "$BAND20"
echo "$BAND30"
echo "$BAND40"
echo "$BAND50"
echo "$BAND60"
echo "$BAND61"
echo "$BAND62"
echo "$BAND70"
echo "$BAND80"
#################################################################################


