#!/bin/bash

echo "THIS SCRIPT WILL GZIP DIRS INTO A SINGLE FILE"
echo ""
tar czvf Archive.tar.gz "$@"
echo "DONE!"
