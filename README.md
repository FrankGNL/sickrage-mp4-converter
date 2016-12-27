[![Build Status](https://travis-ci.org/FrankGNL/sickrage-mp4-converter.svg?branch=master)](https://travis-ci.org/FrankGNL/sickrage-mp4-converter)

# sickrage-mp4-converter

## Description
This Docker image is a merge between [Timhaak his Sickbeard image](https://hub.docker.com/r/timhaak/sickrage/) and a script to convert video files to mp4/m4v format [sickbeard_mp4_automator](https://github.com/mdhiggins/sickbeard_mp4_automator/)

## Usage
To run the container:
```
docker run --restart=always -d -v <config location>:/config -v <video location>:/data -p 8081:8081 frankgnl/sickrage-mp4-converter
```

Then in the sickbeard config. Go to Post Processing settings > Extra Scripts:
```
/usr/bin/python /scripts/sickbeard_mp4_automator/postConversion.py
```

## Customisation
To edit the autoProcess.ini file, download the file make your changes and do a docker cp:
```
docker cp <location of autoProcess.ini> <docker containername>:/scripts/sickbeard_mp4_automator/
```

## todo
- move the script to the config dir for easy editing the autoProcess file
- cleanup Dockerfile
