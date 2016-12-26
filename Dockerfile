FROM alpine:edge
MAINTAINER frank@groenewoud.me

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN apk -U upgrade && \
    apk -U add \
        ca-certificates \
        py2-pip ca-certificates openssl git bash python py-libxml2 py-lxml \
        make gcc g++ python-dev openssl-dev libffi-dev unrar tzdata \
        && \
    pip --no-cache-dir install --upgrade setuptools && \
    pip --no-cache-dir install --upgrade pyopenssl requests requests[security] requests-cache cheetah babelfish "guessit<2" "subliminal<2" stevedore python-dateutil deluge-client qtfaststart requirements && \
    git clone --depth 1 https://github.com/SickRage/SickRage.git /sickrage && \
    apk del make gcc g++ python-dev && \
    rm -rf /tmp && \
    rm -rf /var/cache/apk/*

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

WORKDIR /tmp

RUN wget -q https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz \
    && tar xJf ffmpeg-release-64bit-static.tar.xz \
	&& mv ffmpeg-*-64bit-static/ffmpeg /usr/local/bin/ \
	&& mv ffmpeg-*-64bit-static/ffprobe /usr/local/bin/ \
	&& rm -rf ffmpeg*

RUN mkdir -p /scripts \
    && git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /scripts/sickbeard_mp4_automator

VOLUME ["/config", "/data", "/cache"]

EXPOSE 8081

CMD ["/start.sh"]