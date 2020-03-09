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






