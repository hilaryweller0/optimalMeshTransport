#!/bin/bash -e

#EPS (or PDF): Vector drawings. Embed the font or save the text as 'graphics'.
#TIFF (or JPG): Color or grayscale photographs (halftones): always use a minimum of 300 dpi.
#TIFF (or JPG): Bitmapped line drawings: use a minimum of 1000 dpi.
#TIFF (or JPG): Combinations bitmapped line/half-tone (color or grayscale): a minimum of 500 dpi is required. 

RUN=/home/hilary/OpenFOAM/hilary-2.3.0/run

cpFiles=(meshes/sphereMeshes/MongeAmpereFromPpt/6/8/pptMesh.jpg)


pdfFiles=()


for file in ${cpFiles[*]}
do
    fileNew=`echo $file | sed 's/\//_/g'`
    fileNew=graphics/$fileNew
    rsync -ut $RUN/$file $fileNew
done

for file in ${pdfFiles[*]}
do
    fileNew=`echo $file | sed 's/\//_/g' | sed 's/\./p/g' | sed 's/peps//g'`
    fileNew=graphics/$fileNew.pdf
    pdfFile=`echo $RUN/$file | sed 's/.eps/.pdf/g'`
    
    if [ ! -e $pdfFile ] || [ `stat -c "%Y" $RUN/$file` -gt `stat -c "%Y" $pdfFile` ]
      then
        echo converting $RUN/$file to $pdfFile
        makebb $RUN/$file
        epstopdf $RUN/$file
    fi

    rsync -ut $pdfFile $fileNew
done

