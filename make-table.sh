#!/usr/bin/env bash
#
# Usage:
# $ ./make-table.sh

mkdir -p temp

./extract-field.sh -p '<http://www.w3.org/ns/prov#' > temp/paper.txt
./extract-field.sh -a '<https://w3id.org/linkflows/superpattern/terms/hasContextClass>' > temp/context.txt
./extract-field.sh -a '<https://w3id.org/linkflows/superpattern/terms/hasSubjectClass>' > temp/subject.txt
./extract-field.sh -a '<https://w3id.org/linkflows/superpattern/terms/hasQualifier>' > temp/qualifier.txt
./extract-field.sh -a '<https://w3id.org/linkflows/superpattern/terms/hasRelation>' > temp/relation.txt
./extract-field.sh -a '<https://w3id.org/linkflows/superpattern/terms/hasObjectClass>' > temp/object.txt

paste -d ',' temp/paper.txt temp/context.txt temp/subject.txt temp/qualifier.txt temp/relation.txt temp/object.txt \
  > table.csv

rm -rf temp

cat table.csv \
  | sed 's_https://doi\.org/__' \
  | sed -r 's/http[^,]+[/#]([^,/#])/\1/g' \
  > simplified-table.csv
