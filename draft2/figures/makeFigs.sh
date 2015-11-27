#!/bin/bash -e

./getPlots.sh

if [ "$#" -eq 0 ]
then
    figs=(
        cells
        goldilocksStencil
    )
    i=2
else
    figs=($1)
    i=$2
fi

for fig in ${figs[*]}; do
    echo $fig
    cd $fig
    pdflatex fig
    pdfCrop fig.pdf
    mv fig.pdf ../../figure$i.pdf
    gv ../../figure$i.pdf &
    cd ..
    let i=$i+1
done


#or
#lated fig
#dvips fig
#makebb fig.ps
#mv fig.ps ../../$fig.eps

