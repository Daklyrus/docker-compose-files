#!/bin/bash
URL="https://raw.githubusercontent.com/Daklyrus/docker-compose-files/main/piwigo/docker-compose.yml?token=GHSAT0AAAAAAB2FRCMD75ZD7FX46BJZJ4JEY2WL5QA"
DIR="/home/piwigo"
DIRC="$DIR/config"
DIRG="$DIR/gallery"
COMP="$DIR/docker-compose.yml"

if [ -d "$DIR" ]; then
	echo "$DIR" already exists. Contact Daklyrus.
else
	# Create piwigo directory as parent directory and {config,gallery} as subdirectory
	echo "Creating folders"
	mkdir "$DIR"
	mkdir "$DIRC"
	mkdir "$DIRG"
	echo "DONE"

	# Download the docker-compose.yml
	wget "$URL" && mv docker-compose.yml* "$DIR/docker-compose.yml"

	# Get PORT from user
	echo "Over which port should Piwigo run?"
	read PORTP

	# Write port and paths in docker-compose.yml
	echo "Writing variables"
	sed -i "s+CUSTOMPORT+$PORTP+g" "$COMP"
	sed -i "s+CONFIGDIR+$DIRC+g" "$COMP"
	sed -i "s+GALLERYDIR+$DIRG+g" "$COMP"
	echo "DONE"
  
	# Start the Container
	docker compose -f "$COMP" up -d
	
	# Remove the start.sh after execution
	rm start.sh
fi
