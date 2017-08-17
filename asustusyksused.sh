#!/usr/bin/env bash

curl -O "https://raw.githubusercontent.com/buildig/EHAK/master/geojson/asustusyksus.json" &&
curl -O "https://raw.githubusercontent.com/buildig/EHAK/master/csv/asustusyksus.csv" &&
mapshaper -i asustusyksus.json -filter '"0727,0728,0297,0517".indexOf(OKOOD) > -1' -o asustusyksused.json &&
mapshaper -i asustusyksus.csv -filter '"0727,0728,0297,0517".indexOf(OKOOD) > -1' -sort AREA -o asustusyksused.csv
