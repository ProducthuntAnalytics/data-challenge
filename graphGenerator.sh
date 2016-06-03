#!/bin/bash
rm graphs/*
Rscript "src/master.r"
for fn in `ls graphs`; do
    echo "Converting $fn ..."
    convert -density 150 "graphs/$fn" -quality 90 "graphs/$fn.png"
done
