FROM jlesage/baseimage-gui:debian-11-v4

ENV LIBGL_ALWAYS_SOFTWARE=1 \
    DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

RUN set-cont-env APP_NAME "M3u8Downloader_H"
RUN install_app_icon.sh https://github.com/Harlan-H/M3u8Downloader_H-Docker/raw/master/Icon/logo.png

RUN apt-get update && apt-get install -y \
    libx11-6 \
    libice6 \
    libsm6 \
    libfontconfig1 \
    fontconfig \ 
    fonts-noto \
    && fc-cache -fv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY app/ /app/

RUN chmod +x /app/M3u8Downloader_H

RUN echo '#!/bin/sh' > /startapp.sh \
    && echo 'cd /app' >> /startapp.sh \
    && echo './M3u8Downloader_H' >> /startapp.sh \
    && chmod +x /startapp.sh
