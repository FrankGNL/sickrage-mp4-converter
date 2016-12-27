[![Build Status](https://travis-ci.org/FrankGNL/sickrage-mp4-converter.svg?branch=master)](https://travis-ci.org/FrankGNL/sickrage-mp4-converter)

# sickrage-mp4-converter

This Docker image is a merge between [Timhaak his Sickbeard image](https://hub.docker.com/r/timhaak/sickrage/) and a script to convert video files to mp4/m4v format [sickbeard_mp4_automator](https://github.com/mdhiggins/sickbeard_mp4_automator/)

To run the container:<br>
```docker run --restart=always -d -v <config location>:/config -v <video location>:/data -p 8081:8081 frankgnl/sickrage-mp4-converter```

Then in the sickbeard config. Go to Post Processing settings > Extra Scripts:<br>
```/usr/bin/python /scripts/sickbeard_mp4_automator/postConversion.py```

To edit the autoProcess.ini file, download the file make your changes and do a docker cp:<br>
```docker cp <location of autoProcess.ini> <docker containername>:/scripts/sickbeard_mp4_automator/```
