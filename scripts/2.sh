#!/bin/bash
if [ "$#" -lt 1 ]; then
	echo [$0] -help
	exit
fi


if [ "$1" = "-help" ]; then
	echo Usage:
	echo This is a script that can find authentification problems in /var/log/auth.log.
	echo [$0] [-options]
	echo options :
	echo -show : just once runs grep to find login failures in the whole log
	echo -run : runs grep to find login failures in the whole log and seeks for changes
	exit
fi

if [ "$#" -gt 1 ]; then
	echo [$0] -help
	exit
fi

if [ "$1" = "-show" ]; then
	egrep '.*failure;.*|.*FAILED LOGIN.*|.*invalid user.*' /var/log/auth.log
fi

if [ "$1" = "-run" ]; then
	egrep '.*failure;.*|.*FAILED LOGIN.*|.*invalid user.*' /var/log/auth.log
	tail -f /var/log/auth.log | egrep '.*failure;.*|.*FAILED LOGIN.*|.*invalid user.*'
fi
