FROM ubuntu:22.04
RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://mirrors.tuna.tsinghua.edu.cn/ubuntu/|g' /etc/apt/sources.list
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update


RUN apt-get update && apt-get install -y \
    locales \
    fontconfig \
    fonts-noto-cjk \
    && locale-gen zh_CN.UTF-8 \
    && update-locale LANG=zh_CN.UTF-8

# Set environment variables for locale and language
ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV LC_ALL=zh_CN.UTF-8

RUN apt install -y libwebkit2gtk-4.1-dev \
curl \
wget \
libxdo-dev \
libssl-dev \
libayatana-appindicator3-dev \
librsvg2-dev

COPY ./emNaviDiscover*.deb /app/
RUN dpkg -i /app/emNaviDiscover*.deb
RUN apt clean