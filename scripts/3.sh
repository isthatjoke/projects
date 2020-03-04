#!/bin/bash

location=$(pwd)



if [ $# -lt 1 ]; then
	echo 'it must have more arguments'
	echo [$0] [-help]
	break
fi

if [ "$1" = "-help" ]; then
	echo Usage:
	echo [$0] [-d] [destination] [file] [file] [file] [file] [file]
	break
fi

if [ "$1" = "-d" ]; then
mkdir $2 || echo 'такая папка уже есть или не верно указан путь' && cd $2 && touch $3 $4 $5 $6 $7
fi

if [ "$1" != "-d" ]; then
	echo [$0] [-help]
	break
fi

if [ "$3" = "-d" ]; then
	echo [$0] [-help]
	echo "You have tried to make folders in two destinations"
	break
fi


