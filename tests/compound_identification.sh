#!/bin/bash
#     <test>
#        <param name="anno"      value="TEST0000_mzrt_first.tsv"/>
#        <param name="uniqID"    value="rowID_first"/>
#        <param name="mzID"      value="MZ_first" />
#        <param name="rtID"      value="RT_first" />
#        <param name="library"   value="TEST0000_database.tsv"/>
#        <param name="libuniqID" value="name_database"/>
#        <param name="libmzID"   value="MZ_database" />
#        <param name="librtID"   value="RT_database" />
#        <output name="output"   file="TEST0000_compound_identification_output.tsv" />
#     </test>

SCRIPT=$(basename "${BASH_SOURCE[0]}");
TEST="${SCRIPT%.*}"
TESTDIR="testout/${TEST}"
INPUT_DIR="galaxy/test-data"
OUTPUT_DIR=$TESTDIR
rm -rf "${TESTDIR}"
mkdir -p "${TESTDIR}"
echo "### Starting test: ${TEST}"
if [[ $# -gt 0 ]]; then OUTPUT_DIR=$1 ; fi
mkdir -p "${OUTPUT_DIR}"

compound_identification.py \
    -a   "$INPUT_DIR/TEST0000_mzrt_first.tsv" \
    -id rowID_first \
    -mzi MZ_first \
    -rti RT_first \
    -lib "$INPUT_DIR/TEST0000_database.tsv" \
    -lid name_database \
    -lmzi MZ_database \
    -lrti RT_database \
    -o  "$OUTPUT_DIR/TEST0000_compound_identification_output.tsv"

echo "### Finished test: ${TEST} on $(date)"
