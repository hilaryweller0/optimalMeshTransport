#!/bin/bash -e

RUN=/home/hilary/OpenFOAM/hilary-2.*/run

cpFiles=(
    meshes/sphereMeshes/thickSphere/cutSphere.png
    meshes/sphereMeshes/plots/MAconvergence.eps
    meshes/sphereMeshes/plots/totalIterations.eps
)


pngFiles=()

pdfFiles=(meshes/sphereMeshes/HR/5/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV0/5/2/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV0/5/4/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV0/5/8/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV0/5/16/0/mesh.eps

          meshes/sphereMeshes/HR/5/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV0/5/2/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV0/5/4/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV0/5/8/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV0/5/16/0/meshZoom.eps
          
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/2/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/4/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/8/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/16/0/mesh.eps

          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/2/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/4/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/8/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/16/0/meshZoom.eps
          
          meshes/sphereMeshes/MongeAmpereV1/5/2/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV1/5/4/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV1/5/8/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV1/5/16/0/mesh.eps

          meshes/sphereMeshes/MongeAmpereV1/5/2/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV1/5/4/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV1/5/8/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV1/5/16/0/meshZoom.eps
          
          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/2/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/4/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/8/0/mesh.eps
          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/16/0/mesh.eps

          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/2/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/4/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/8/0/meshZoom.eps
          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/16/0/meshZoom.eps
          
          meshes/sphereMeshes/RinglerLloyd/5/1/0/mesh.eps
          meshes/sphereMeshes/RinglerLloyd/5/2/0/mesh.eps
          meshes/sphereMeshes/RinglerLloyd/5/4/0/mesh.eps
          meshes/sphereMeshes/RinglerLloyd/5/8/0/mesh.eps
          meshes/sphereMeshes/RinglerLloyd/5/16/0/mesh.eps
          
          meshes/sphereMeshes/RinglerLloyd/5/1/0/meshZoom.eps
          meshes/sphereMeshes/RinglerLloyd/5/2/0/meshZoom.eps
          meshes/sphereMeshes/RinglerLloyd/5/4/0/meshZoom.eps
          meshes/sphereMeshes/RinglerLloyd/5/8/0/meshZoom.eps
          meshes/sphereMeshes/RinglerLloyd/5/16/0/meshZoom.eps
          
          meshes/sphereMeshes/RinglerLloyd/5/8/distArea.eps
          meshes/sphereMeshes/RinglerLloyd/5/8/distDx.eps
          meshes/sphereMeshes/RinglerLloyd/5/8/distSkew.eps
          meshes/sphereMeshes/RinglerLloyd/5/8/distOrthogonality.eps
          meshes/sphereMeshes/RinglerLloyd/5/8/distCentroidal.eps

          meshes/sphereMeshes/MongeAmpereV0/5/8/distArea.eps
          meshes/sphereMeshes/MongeAmpereV0/5/8/distDx.eps
          meshes/sphereMeshes/MongeAmpereV0/5/8/distSkew.eps
          meshes/sphereMeshes/MongeAmpereV0/5/8/distOrthogonality.eps
          meshes/sphereMeshes/MongeAmpereV0/5/8/distCentroidal.eps
          meshes/sphereMeshes/MongeAmpereV0/5/8/MAconvergence.eps
          meshes/sphereMeshes/MongeAmpereV0/5/8/MAratios.eps
          meshes/sphereMeshes/MongeAmpereV0/5/16/MAconvergence.eps
          meshes/sphereMeshes/MongeAmpereV0/5/16/MAratios.eps

          meshes/sphereMeshes/MongeAmpereV1/5/8/distArea.eps
          meshes/sphereMeshes/MongeAmpereV1/5/8/distDx.eps
          meshes/sphereMeshes/MongeAmpereV1/5/8/distSkew.eps
          meshes/sphereMeshes/MongeAmpereV1/5/8/distOrthogonality.eps
          meshes/sphereMeshes/MongeAmpereV1/5/8/distCentroidal.eps
          meshes/sphereMeshes/MongeAmpereV1/5/8/MAconvergence.eps
          meshes/sphereMeshes/MongeAmpereV1/5/8/MAratios.eps
          meshes/sphereMeshes/MongeAmpereV1/5/16/MAconvergence.eps
          meshes/sphereMeshes/MongeAmpereV1/5/16/MAratios.eps
          
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/8/distArea.eps
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/8/distDx.eps
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/8/distSkew.eps
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/8/distOrthogonality.eps
          meshes/sphereMeshes/MongeAmpereV0Voronoi/5/8/distCentroidal.eps

          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/8/distArea.eps
          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/8/distDx.eps
          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/8/distSkew.eps
          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/8/distOrthogonality.eps
          meshes/sphereMeshes/MongeAmpereV1Voronoi/5/8/distCentroidal.eps

          meshes/sphereMeshes/MongeAmpereV1/5/2/distDx.eps
          meshes/sphereMeshes/MongeAmpereV1/5/4/distDx.eps
          meshes/sphereMeshes/MongeAmpereV1/5/9/distDx.eps
          meshes/sphereMeshes/MongeAmpereV1/5/10/distDx.eps
          meshes/sphereMeshes/MongeAmpereV1/5/16/distDx.eps

          meshes/sphereMeshes/MongeAmpereV1/5/2/distArea.eps
          meshes/sphereMeshes/MongeAmpereV1/5/4/distArea.eps
          meshes/sphereMeshes/MongeAmpereV1/5/9/distArea.eps
          meshes/sphereMeshes/MongeAmpereV1/5/10/distArea.eps
          meshes/sphereMeshes/MongeAmpereV1/5/16/distArea.eps
          )


for file in ${cpFiles[*]}
do
    fileNew=`echo $file | sed 's/\//_/g'`
    fileNew=graphics/$fileNew
    rsync -ut $RUN/$file $fileNew
done

for file in ${pngFiles[*]}
do
    fileNew=`echo $file | sed 's/\//_/g' | sed 's/\./p/g' | sed 's/peps//g'`
    fileNew=graphics/$fileNew.png
    pngFile=`echo $RUN/$file | sed 's/.eps/.png/g'`
    
    if [ ! -e $pngFile ] || [ `stat -c "%Y" $RUN/$file` -gt `stat -c "%Y" $pngFile` ]
      then
        echo converting $RUN/$file to $pngFile
        eps2png2 $RUN/$file
    fi

    rsync -ut $pngFile $fileNew
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

