## Overview
asciidoctor-auto-run is a bash script that monitors for changes to [AsciiDoc](http://asciidoctor.org/docs/what-is-asciidoc/) files and runs asciidoctor when changes are detected to generate new HTML.
asciidoctor-auto-run monitors the adoc directory. To get started simply create a new AsciiDoc file in the adoc directory with the file extension '.adoc'. Changes after that will generate new HTML files and place them in the specified web directory. Your old adoc files will be archived in the archive directory. 

## Requirements
asciidoctor
`apt-get install asciidoctor`
when-changed
`pip install when-changed`

Optionally a webserver

## Config
```
#FILE: conf/defaults.conf
#CHANGE webdir to the correct web directory 
webdir="/var/www/"
```
