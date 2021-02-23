#!/usr/bin/env bash
#
# Usage:
# $ ./extract-field.sh -a '<https://w3id.org/linkflows/superpattern/terms/hasSubjectClass>'

np op extract $1 --out-format nq nanopubs.trig \
  | grep "$2" \
  | awk '{print $3}' \
  | sed 's/[<>]//g'
