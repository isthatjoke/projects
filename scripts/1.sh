#!/bin/bash


if [ $# -lt 2 ] || [ $# -gt 3 ]
then
	echo '--------------------------------------------------------------------------
This is a script that can find empty strings and delete it.
Also it will convert lowercase words to uppercase.
it should have 2 arguments.
Usage: $0 [input file] [output file]
--------------------------------------------------------------------------'
	exit
fi




grep -v '^$' $1 | tr -d "\r" > tempfile && mv tempfile $2
tr '[:lower:]' '[:upper:]' < $2 > tempfile && mv tempfile $2

