#1

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


#2
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


#3

#!/bin/bash

Usage(){
	cat <<EOF
Script can make folders and files inside. 
It can make only files if you decide, just dont text destination path for creating folder. 
The path should begins from '/'.
[$0] [-d] [destination] [file(s)]

EOF
exit 3 
}

if [ -d "$2" ]; then
	echo 'folder already exists'
	exit 2
fi
if [ "$3" = "-d" ]; then
	echo [$0] [-help]
	echo "You have tried to make folders in two paths"
	exit 1
fi

while [[ $# -gt 0 ]] ; do
case "$1" in
	-help)  Usage && break;;
	-d) shift && continue ;; 
	/**) { FOLDERS+=("$1") && shift ;};;
	*) { FILES+=("$1") && shift ;};;
esac
[[ -h $1 || -f $1 ]] && echo "files already exists" && break && exit 2
done

if (( ${#FOLDERS[@]} != 0)); then
	mkdir $(echo "${FOLDERS[@]}") && cd $(echo "${FOLDERS[@]}") || echo "не указаны папки для создания, создаем файлы"
	touch $(echo "${FILES[@]}")
	grep -e '/^.*\.sh/' $(echo "${FILES[@]}") || chmod +x $(echo "${FILES[@]}")
else 
	touch $(echo "${FILES[@]}")
	grep -e '/^.*\.sh/' $(echo "${FILES[@]}") || chmod +x $(echo "${FILES[@]}")
fi