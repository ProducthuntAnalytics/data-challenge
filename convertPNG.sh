#!/bin/bash
for fn in `ls src`; do
    echo "Making the graphs: $fn"
    Rscript "src/$fn"
done
for fn in `ls graphs`; do
    echo "Converting $fn ..."
    convert -density 150 "graphs/$fn" -quality 90 "graphs/$fn.png"
done
