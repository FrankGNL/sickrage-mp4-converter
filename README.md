[![Docker Stars](https://img.shields.io/docker/stars/frankgnl/sickrage-mp4-converter.svg)](https://hub.docker.com/r/frankgnl/sickrage-mp4-converter/) [![Docker Pulls](https://img.shields.io/docker/pulls/frankgnl/sickrage-mp4-converter.svg)](https://hub.docker.com/r/frankgnl/sickrage-mp4-converter/) [![Docker Automated buil](https://img.shields.io/docker/automated/frankgnl/sickrage-mp4-converter.svg)](https://hub.docker.com/r/frankgnl/sickrage-mp4-converter/) [![](https://images.microbadger.com/badges/image/frankgnl/sickrage-mp4-converter.svg)](https://microbadger.com/images/frankgnl/sickrage-mp4-converter "Get your own image badge on microbadger.com") [![Build Status](https://travis-ci.org/FrankGNL/sickrage-mp4-converter.svg?branch=master)](https://travis-ci.org/FrankGNL/sickrage-mp4-converter)

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
/usr/bin/python /config/scripts/sickbeard_mp4_automator/postConversion.py
```

## Customisation
To edit the autoProcess.ini file, go to your <config location>/scripts/sickbeard_mp4_automator on your host and edit the autoProcess.ini

## Todo
- cleanup Dockerfile
