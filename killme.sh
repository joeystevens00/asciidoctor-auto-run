#!/bin/bash
#Hacky and so unnecessary but no proc will make it out alive...

killme() {
alive=true
while "$alive"; do
	check=$(ps aux | grep "$1" | grep -v "grep" | awk {'print $2'})
	if [ -z "$check" ]; then 
		alive=false
	elif [ -n "$check" ]; then
		echo "Something went wrong.. trying again."
		kill -9 $check
	fi
done
}

killme 'monitor-files.sh'
killme 'when-changed'
