#!/bin/bash
#ensure directory sanity no matter where we are called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source "../conf/defaults.conf"
adocfile=$1
adocfilepath=$adocfolder$adocfile
htmlfile=$(echo $adocfile | cut -d "." -f1)
htmlfile=$adocfolder$htmlfile.html
timestamp=`date +"%D_%T" | tr '/:' '-'`
archivefile="$archive$adocfile-$timestamp"
#Update test.html
cp $adocfilepath $archivefile
asciidoctor $adocfilepath
cp $htmlfile $webdir


