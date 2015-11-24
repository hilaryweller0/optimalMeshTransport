#!/bin/bash -e

./getPlots.sh

if [ "$#" -eq 0 ]
then
    figs=(
        planeMeshes
        planeMeshConvergence
        planeMeshDiags
        X2meshes
        X4meshes
        X8meshes
        X16meshes
        meshSizes
        meshSizesVolume
        meshStats
        convergence
    )
else
    figs=($1 $2 $3 $4 $5 $6 $7 $8 $9)
fi

for fig in ${figs[*]}; do
    echo $fig
    cd $fig
    latex fig
    dvips fig
    makebb fig.ps
    mv fig.ps ../../$fig.eps
    gv ../../$fig.eps &
    cd ..
done


#or
#lated fig
#dvips fig
#makebb fig.ps
#mv fig.ps ../../$fig.eps

