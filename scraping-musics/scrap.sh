#! /bin/bash
#! /bin/zsh

RED='\033[0;31m'
GREEN='\033[0;32m'
DEFAULT='\033[0m'
YELLOW='\033[1;33m'
GRAY='\033[1;30m'

if [ ! -d "../sql-scripts/scrapping" ]
then
	mkdir ../sql-scripts/scrapping
fi


OP=$1

if [ -z "$OP" ]
then
	echo "./scrap.sh [clean | create | ls]"
	exit
fi

if [ "$OP" != "clean" ] && [ "$OP" != "create" ] && [ "$OP" != "ls" ]
then
	echo -e "/scrap.sh ${RED}[clean | create | ls]${DEFAULT}"
	exit
fi

if [ "$OP" = "CLEAN" ]
then
	if [ -f "../sql-scripts/scrapping/*.sql" ]
	then
		rm ../sql-scripts/scrapping
	fi
elif [ "$OP" = "LS" ]
then
	ls ../sql-scripts/scrapping
	exit
fi

FILENAME=$2
START_ID=$3
COD_ALBUM=$4

if [ ! -f "$FILENAME" ]
then
	echo -e "${RED}Arquivo $filename não existe!"
	echo -e "${GREEN}./scrap.sh $[clean | create | ls] ${RED}<FILENAME>${GRAY} <START_ID> <COD_ALBUM>${DEFAULT}"
	exit
fi

if [ -z "$START_ID" ]
then
	echo -e "${RED}ID de inicio não foi passado!"
	echo -e "${GREEN}./scrap.sh [clean | create | ls] <FILENAME> ${RED}<START_ID>${GRAY} <COD_ALBUM>${DEFAULT}"
	exit
fi

if [ -z "$COD_ALBUM" ]
then
	echo -e "${RED}Código do álbum não foi passado!"
	echo -e ".${GREEN}/scrap.sh <[clean | create | ls] FILENAME> <START_ID> ${RED}<COD_ALBUM>${DEFAULT}"
	exit
fi

python3 main.py $FILENAME $START_ID $COD_ALBUM
mv *.sql ../sql-scripts/scrapping
echo -e "${GREEN}Queries Geradas!${DEFAULT}"

exit

