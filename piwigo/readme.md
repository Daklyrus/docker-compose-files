# Instruction
Please note that in docker-compose.yml some data has to be adjusted. 


## volumes
Here I recommend, as for other projects, that you name a folder in the home directory according to the program. 

    mkdir Piwigo && mkdir Piwigo/{config,gallery}

If this was created in the root directory, the path now looks like this: 

    /root/Piwigo/config
    /root/Piwigo/gallery

In docker-compose.yml, it must now be modified as follows: 

    volumes:
      - /root/Piwigo/config:/config
      - /root/Piwigo/gallery:/gallery
## ports
Instead of CUSTOMPORT you have to enter the port you want to use to access the web photo gallery. 
