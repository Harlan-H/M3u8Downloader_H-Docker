FROM jlesage/baseimage-gui:debian-12-v4

ENV LIBGL_ALWAYS_SOFTWARE=1 
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 
ENV TZ=Asia/Shanghai 
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8


RUN set-cont-env APP_NAME "M3u8Downloader_H"
RUN install_app_icon.sh https://github.com/Harlan-H/M3u8Downloader_H-Docker/raw/master/Icon/logo.png

RUN apt-get update && apt-get install -y \
    libx11-6 \
    libice6 \
    libsm6 \
    libfontconfig1 \
    fontconfig \ 
    fonts-noto \
    libgtk-3-0 \
    libdbusmenu-gtk3-4 \
    libayatana-appindicator3-1 \
    libxtst6 \
    libx11-xcb1  \
    ca-certificates \
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
