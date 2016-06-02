#!/bin/bash
for fn in `ls *.pdf`; do
    echo "Converting $fn ..."
    convert -density 150 $fn -quality 90 "$fn.png"
done
