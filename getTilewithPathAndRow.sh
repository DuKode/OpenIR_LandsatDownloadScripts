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
INDEXDIR="p"$TILEPATH"_r"$TILEROW
TEMPDIR="TMP_"$INDEXDIR

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
#################################################################################
#PREPARE LOCAL TEMPORARY FOLDER
#################################################################################
echo "#################################"
echo "PREPARING LOCAL TEMPORARY FOLDER"
echo " "
if [ -d $TEMPDIR ]; then 
   
	echo "temporary directory already exists! thanks for asking..."
	#################################################################################
	#empty tmp directory before continuing 
	#################################################################################
	echo $(ls -A $TEMPDIR)
	if [ "$(ls -A $TEMPDIR)" ]; then

	
	    # do dangerous stuff
		echo " "
		read -p "Are you sure you want to delete the data from temporary directory? (y or n) " -n 1 -r
		echo " "
		if [[ $REPLY =~ ^[Yy]$ ]];then
			echo "Emptying temporary directory...."
			rm $TEMPDIR/*
			echo "Done"
		else
			echo "$TEMPDIR is Empty"
		fi
	else
		echo "The temporary directory content if any will not be deleted"
	fi

	
else
	mkdir $TEMPDIR
	echo "Created temporary directory for data storage..."
fi

echo " "
echo "lookup FTP directory" $TILEDOWNLOADPATH
read -p "Press [Enter] key to start lookup FTP directory... FTP directory: $TILEDOWNLOADPATH"
#################################################################################

wget -rq -nd --no-parent -P $TEMPDIR $TILEDOWNLOADPATH 
#wget -r -nd --no-parent -P $TEMPDIR $TILEDOWNLOADPATH 
cd $TEMPDIR/

FILES=*

TILEFILESARRAY=(`echo $FILES`)

# for i in ${TILEFILESARRAY[@]}; do
# 	echo "$i"
# done

cd .. 

echo " "
read -p "Press [Enter] key to download the first file"
#################################################################################


#################################################################################
###### IMAGE SELECTION ????? 
# how are we going to do the selection from the list I am not sure yet. 


#################################################################################
#download data
#################################################################################
TILEDOWNLOADPATH="ftp://ftp.glcf.umd.edu/glcf/Landsat/WRS2/p"$TILEPATH"/r"$TILEROW"/${TILEFILESARRAY[0]}/*"

echo "#################################"
echo "DOWNLOAD DATA\n"
echo " "
echo $TILEDOWNLOADPATH
echo " "

TILENAME=${TILEFILESARRAY[0]}

read -p "Are you sure you want to download the data? (y or n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff
	wget -r -nd --no-parent -P $TEMPDIR $TILEDOWNLOADPATH 
	
	echo "\nfinished directory files download"
	read -p "Press [Enter] key to continue"
fi


#################################################################################
#read downloaded files
#################################################################################
cd $TEMPDIR/
FILES=*
TILEFILESARRAY=(`echo $FILES`)
RESULT="found"
for i in ${TILEFILESARRAY[@]}; do
	if [[ "$i" == *B10* ]]; then
		BAND10=$i
		echo "$BAND10 exists!"
	fi
	#B20
	if [[ "$i" == *B20* ]]; then
		BAND20=$i
		echo "$BAND20 exists!"
	fi
	#B30
	if [[ "$i" == *B30* ]]; then
		BAND30=$i
		echo "$BAND30 exists!"
	fi
	#B40
	if [[ "$i" == *B40* ]]; then
		BAND40=$i
		echo "$BAND40 exists!"
	fi
	
	#B50
	if [[ "$i" == *B50* ]]; then
		BAND50=$i
		echo "$BAND50 exists!"
	fi
	
	#B60
	if [[ "$i" == *B60* ]]; then
		BAND60=$i
		echo "$BAND60 exists!"
	fi
	
	#B61
	if [[ "$i" == *B61* ]]; then
		BAND61=$i
		echo "$BAND61 exists!"
	fi
	
	#B62
	if [[ "$i" == *B62* ]]; then
		BAND62=$i
		echo "$BAND62 exists!"
	fi
	
	#B70
	if [[ "$i" == *B70* ]]; then
		BAND70=$i
		echo "$BAND70 exists!"
	fi
	
	#B80
	if [[ "$i" == *B80* ]]; then
		BAND80=$i
		echo "$BAND80 exists!"
	fi
done

echo "#################################"
echo "UNZIPING FILES"
echo " "
if [[ -a $BAND10 ]]; then 
echo "$TEMPDIR/$BAND10" 
gunzip -d -f $BAND10 
#$(echo $BAND10|sed 's/.gz/ /g')
BAND10TIF=$(echo $BAND10|sed 's/.gz/ /g')
echo $BAND10TIF
fi 

if [[ -a $BAND20 ]]; then 
echo "$TEMPDIR/$BAND20" 
gunzip -d -f $BAND20 
#$(echo $BAND10|sed 's/.gz/ /g')
BAND20TIF=$(echo $BAND20|sed 's/.gz/ /g')
echo $BAND20TIF
fi 

if [[ -a $BAND30 ]]; then 
echo "$TEMPDIR/$BAND30" 
gunzip -d -f $BAND30 
#$(echo $BAND10|sed 's/.gz/ /g')
BAND30TIF=$(echo $BAND30|sed 's/.gz/ /g')
echo $BAND30TIF
fi 

if [[ -a $BAND40 ]]; then 
echo "$TEMPDIR/$BAND40" 
gunzip -d -f $BAND40 
#$(echo $BAND10|sed 's/.gz/ /g')
BAND40TIF=$(echo $BAND40|sed 's/.gz/ /g')
echo $BAND40TIF
fi 

if [[ -a $BAND50 ]]; then 
echo "$TEMPDIR/$BAND50" 
gunzip -d -f $BAND50 
#$(echo $BAND10|sed 's/.gz/ /g')
BAND50TIF=$(echo $BAND50|sed 's/.gz/ /g')
echo $BAND50TIF
fi 

if [[ -a $BAND60 ]]; then 
echo "$TEMPDIR/$BAND60" 
gunzip -d -f $BAND60 
#$(echo $BAND10|sed 's/.gz/ /g')
BAND60TIF=$(echo $BAND60|sed 's/.gz/ /g')
echo $BAND60TIF
fi 

if [[ -a $BAND61 ]]; then 
echo "$TEMPDIR/$BAND61" 
gunzip -d -f $BAND61 
#$(echo $BAND10|sed 's/.gz/ /g')
BAND61TIF=$(echo $BAND61|sed 's/.gz/ /g')
echo $BAND61TIF
fi 

if [[ -a $BAND62 ]]; then 
echo "$TEMPDIR/$BAND62" 
gunzip -d -f $BAND62
#$(echo $BAND10|sed 's/.gz/ /g')
BAND62TIF=$(echo $BAND62|sed 's/.gz/ /g')
echo $BAND62TIF
fi 

if [[ -a $BAND70 ]]; then 
echo "$TEMPDIR/$BAND70" 
gunzip -d -f $BAND70 
#$(echo $BAND10|sed 's/.gz/ /g')
BAND70TIF=$(echo $BAND70|sed 's/.gz/ /g')
echo $BAND70TIF
fi 

if [[ -a $BAND80 ]]; then 
echo "$TEMPDIR/$BAND80" 
gunzip -d -f $BAND80 
#$(echo $BAND10|sed 's/.gz/ /g')
BAND80TIF=$(echo $BAND80|sed 's/.gz/ /g')
echo $BAND80TIF
fi 

#################################################################################
# GENERATE COMPOSITES
#################################################################################
echo "#################################"
echo "GENERATE COMPOSITES"
echo " "
#use for surface reflectance 
#convert ${args[0]} ${args[1]} ${args[2]} -combine -level 0.0%x8% ${args[3]}

## TO DO? 
## add if statement if bands exist. 
## append stuff to log

#use for GLS2005
if [[ -a $BAND30TIF && -a $BAND20TIF && -a $BAND10TIF ]]; then 
convert -monitor $BAND30TIF $BAND20TIF $BAND10TIF -combine $TILENAME".321.TIF"
echo 'from 16 to 8bit'
convert -monitor $TILENAME".321.TIF" -depth 8 $TILENAME".8bit.321.TIF"
rm  $TILENAME".321.TIF"
fi

if [[ -a $BAND40TIF && -a $BAND30TIF && -a $BAND20TIF ]]; then 
convert -monitor $BAND40TIF $BAND30TIF $BAND20TIF -combine $TILENAME".432.TIF"
echo 'from 16 to 8bit'
convert -monitor $TILENAME".432.TIF" -depth 8 $TILENAME".8bit.432.TIF"
rm  $TILENAME".432.TIF"
fi

if [[ -a $BAND50TIF && -a $BAND40TIF && -a $BAND30TIF ]]; then 
convert -monitor $BAND50TIF $BAND40TIF $BAND30TIF -combine $TILENAME".543.TIF"
echo 'from 16 to 8bit'
convert -monitor $TILENAME".543.TIF" -depth 8 $TILENAME".8bit.543.TIF"
rm $TILENAME".543.TIF"
fi 

if [[ -a $BAND40TIF && -a $BAND50TIF && -a $BAND30TIF ]]; then 
convert -monitor $BAND40TIF $BAND50TIF $BAND30TIF -combine $TILENAME".453.TIF"
echo 'from 16 to 8bit'
convert -monitor $TILENAME".453.TIF" -depth 8 $TILENAME".8bit.453.TIF"
rm  $TILENAME".453.TIF" 
fi

if [[ -a $BAND70TIF && -a $BAND50TIF && -a $BAND40TIF ]]; then 
convert -monitor $BAND70TIF $BAND50TIF $BAND40TIF -combine $TILENAME".754.TIF"
echo 'from 16 to 8bit'
convert -monitor $TILENAME".754.TIF" -depth 8 $TILENAME".8bit.754.TIF"
rm $TILENAME".754.TIF" 
fi 

##########################################
# // apply georeference to composites // #
##########################################
listgeo $BAND10TIF > $BAND10".txt" 

geotifcp -g $BAND10".txt"  $TILENAME".8bit.321.TIF" "321.TIF"
geotifcp -g $BAND10".txt"  $TILENAME".8bit.321.TIF" "432.TIF"
geotifcp -g $BAND10".txt"  $TILENAME".8bit.321.TIF" "543.TIF"
geotifcp -g $BAND10".txt"  $TILENAME".8bit.321.TIF" "453.TIF"
geotifcp -g $BAND10".txt"  $TILENAME".8bit.321.TIF" "754.TIF"

rm $TILENAME".8bit.321.TIF"
rm $TILENAME".8bit.432.TIF"
rm $TILENAME".8bit.543.TIF"
rm $TILENAME".8bit.453.TIF"
rm $TILENAME".8bit.754.TIF"



# #remove 0 0 0 rgb value and replace with transparency.
# gdalwarp -dstalpha -srcnodata "0 0 0" -dstnodata "0 0 0" -co "TILED=YES" ${args[3]}'GEO.TIF' ${args[3]}'GEO_alpha.TIF'
# #remove not georeferenced file
# rm ${args[3]} 
# rm ${args[0]}'.txt'

#################################################################################
# REMOVE FILES
#################################################################################
echo "### Removing TMP dir ###" 

cd ..
mkdir $INDEXDIR
mv $TEMPDIR/"321.TIF" $INDEXDIR
mv $TEMPDIR/"432.TIF" $INDEXDIR
mv $TEMPDIR/"543.TIF" $INDEXDIR
mv $TEMPDIR/"453.TIF" $INDEXDIR
mv $TEMPDIR/"754.TIF" $INDEXDIR

rm -rf -- $TEMPDIR


#################################################################################
# Slice and generate index.html
#################################################################################
echo "### Running gdal2tiles_openir.py ###"

TIFFILES=($INDEXDIR/*)
ARRAY=$(IFS=,; echo "[${TIFFILES[*]}]")

./gdal2tiles_openir.py ${ARRAY[*]} $INDEXDIR


rm $INDEXDIR"/*.TIF"

echo ###DONE WITH THE PROCESS###
echo ### Enjoy your maps- OpenIR ###
