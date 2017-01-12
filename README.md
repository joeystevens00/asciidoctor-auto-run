## Overview
asciidoctor-auto-run is a bash script that monitors for changes to [AsciiDoc](http://asciidoctor.org/docs/what-is-asciidoc/) files and runs asciidoctor when changes are detected to generate new HTML.
The adoc directory is monitored for new files and changes to existing files. To get started simply create a new AsciiDoc file in the adoc directory with the file extension '.adoc'. A new HTML file will be created and placed in the specified web directory, and any changes to that adoc file will trigger the creation of a new HTML file. Your old adoc files will be archived in the archive directory. 

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
