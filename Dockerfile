################################################################################
# PROFILER                                                                     #
################################################################################
FROM ubuntu:24.04 AS profiler
ARG http_proxy
ARG https_proxy

ENV http_proxy=$http_proxy
ENV https_proxy=$https_proxy

ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && \
    apt-get install -y \
    curl \
    git

    # Install Node.js and NPM
RUN curl -sL https://deb.nodesource.com/setup_22.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

# Install Firefox Profiler
WORKDIR /root/
RUN git clone https://github.com/firefox-devtools/profiler.git
WORKDIR /root/profiler
RUN yarn install
ENV FX_PROFILER_HOST=127.0.0.1
