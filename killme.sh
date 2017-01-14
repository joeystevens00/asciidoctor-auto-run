#!/bin/bash
#Hacky and so unnecessary but no proc will make it out alive...

err() {
 	echo "$2"
	exit $1
}

killme() {
alive=true
round=1
while "$alive"; do
        check=$(ps aux | grep "$1" | grep -v "grep" | awk {'print $2'})
	if [ -z "$check" ]; then
		alive=false
	elif [ -n "$check" ]; then
		kill -9 $check || err $? "You don't have permissions to kill this. Aborting"
		if [ "$round" -le 3 ]; then
			echo "Retrying.. Attempt: $round"
		elif [ "$round" -gt 3 ]; then
			err $? "Maximum retries hit.. abort"
		else
			err $? "Unknown error"
		fi
	else
		err $? "Something went wrong.. Abort"
	fi
	((round++))
done
}

killme 'monitor-files.sh'
killme 'when-changed'
