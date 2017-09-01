#!/usr/bin/env bash

curl -O "https://raw.githubusercontent.com/buildig/EHAK/master/geojson/asustusyksus.json" &&
curl -O "https://raw.githubusercontent.com/buildig/EHAK/master/csv/asustusyksus.csv" &&

mapshaper -i asustusyksus.json \
 -filter '"0727,0728,0297,0517".indexOf(OKOOD) > -1' \
 -each 'AREA=(AREA / 1000000).toFixed(2)' -o asustusyksused.json &&

mapshaper -i asustusyksus.csv \
 -filter '"0727,0728,0297,0517".indexOf(OKOOD) > -1' \
 -each 'AREA=(AREA / 1000000).toFixed(2)' \
 -sort ANIMI \
 -o asustusyksused.csv &&

# Ühisvalla piir

curl -O "https://raw.githubusercontent.com/buildig/EHAK/master/geojson/omavalitsus.json" &&
mapshaper omavalitsus.json \
 -filter 'OKOOD=="0727" || OKOOD=="0728" || OKOOD=="0297" || OKOOD=="0517"' -dissolve \
 -each 'ONIMI = "Saue vald"' \
 -o sauevald.json
