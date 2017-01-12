#!/bin/bash
#ensure directory sanity no matter where we are called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source "../conf/defaults.conf"

while :; do
	adocfiles=`ls "$adocfolder" | grep .adoc`
	for i in $adocfiles; do
		file="$adocfolder$i"

		#Will return nothing if we don't already have a proc
		whenChangedRunning=`ps aux | grep $i | grep when-changed`
		#If whenChangedRunning is empty
		if [ -z "$whenChangedRunning" ]; then
			when-changed $file -c "bash asciidoctor-refresh.sh $i" &
			#We must sleep a second to trigger when-changed
			sleep 1
			#In case the file was just created we want to trigger when-changed immediately
			touch $file
		fi
	done
	sleep 10
done
