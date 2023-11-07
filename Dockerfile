FROM ubuntu:22.04
ARG FORTIO_VERSION=1.5.1

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y --no-install-recommends build-essential libssl-dev git curl net-tools tcpdump traceroute iputils-ping jq wget iperf3 unzip python3 \
  && rm -rf /var/lib/apt/lists/*
RUN curl -L https://github.com/fortio/fortio/releases/download/v${FORTIO_VERSION}/fortio_${FORTIO_VERSION}_amd64.deb --output /tmp/fortio_${FORTIO_VERSION}_amd64.deb
RUN sudo dpkg -i /tmp/fortio_${FORTIO_VERSION}_amd64.deb
RUN git clone https://github.com/wg/wrk.git wrk
RUN cd wrk
RUN sudo make
RUN sudo cp wrk /usr/local/bin