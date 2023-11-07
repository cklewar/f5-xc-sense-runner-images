FROM ubuntu:latest
ARG FORTIO_VERSION=1.5.1

RUN sudo apt-get update
RUN sudo apt-get -y install --no-install-recommends build-essential libssl-dev git curl net-tools tcpdump traceroute iputils-ping jq wget iperf3 unzip
RUN curl -L https://github.com/fortio/fortio/releases/download/v${FORTIO_VERSION}/fortio_${FORTIO_VERSION}_amd64.deb --output /tmp/fortio_${FORTIO_VERSION}_amd64.deb
RUN sudo dpkg -i /tmp/fortio_${FORTIO_VERSION}_amd64.deb
RUN git clone https://github.com/wg/wrk.git wrk
RUN cd wrk
RUN sudo make
RUN sudo cp wrk /usr/local/bin