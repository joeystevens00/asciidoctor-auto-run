#!/bin/bash
source "conf/defaults.conf"

echo "Directory locations"
echo "Archive Files: $archive"
echo "Adoc Files: $adocfolder"
echo "Config Files: $conf"
echo "Web directory: $webdir"

checkIfDirExists() {
 if [ ! -d "$1/" ]; then
	echo "Detected missing $1" 
        echo "Creating the $1 directory"
        mkdir $1
fi
}

checkIfInstalled() {
        command -v $1 >/dev/null 2>&1 || { echo "I require $1 but it's not installed.  Aborting." >&2; exit 1; }
}

#Check for dependencies 
checkIfInstalled when-changed
checkIfInstalled asciidoctor

#Check to see if we need to create some directories
checkIfDirExists adoc
checkIfDirExists archive
checkIfDirExists html

echo "Starting the monitoring script"
bash "bin/monitor-files.sh" &

#Check to see if the script is running
monitorFilesProc=$(ps aux | grep monitor-files | grep -v "grep")
if [ -n "$monitorFilesProc" ]; then
	echo "Success! The script is running"
else
	echo "Something went wrong!"
fi

