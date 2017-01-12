#!/bin/bash
#ensure directory sanity no matter where we are called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source "../conf/defaults.conf"
adocfile=$1

#Add the path
adocfilepath=$adocfolder$adocfile

#Remove the adoc extension
htmlfile=$(echo $adocfile | cut -d "." -f1)

#Add the path and html extension
htmlfile=$adocfolder$htmlfile.html
timestamp=`date +"%D_%T" | tr '/:' '-'`
archivefile="$archive$adocfile-$timestamp"

#Archive the adoc file
cp $adocfilepath $archivefile

#Generate a new HTML file
asciidoctor $adocfilepath

#Copy the HTML file to the web directory
cp $htmlfile $webdir

#Move the original html file to the html directory
mv $htmlfile $htmldir
