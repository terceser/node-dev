FROM node:14.17

# install rsync
RUN apt-get update \
    && apt-get install -y rsync

# install chrome
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt-get update \
    && apt-get install -y xvfb libdbus-glib-1-2 libxss1 google-chrome-stable

# install firefox
RUN set -x && wget -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US" \
    && tar -xjf firefox.tar.bz2 \
    && ln -s /firefox/firefox /usr/bin/firefox

# install pnpm
RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm

# install nx
RUN npm install -g nx