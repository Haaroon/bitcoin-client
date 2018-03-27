FROM debian:8
LABEL maintainer="Haaroon M. Yousaf (h.yousaf [at] ucl.ac.uk)"

################## BEGIN INSTALLATION ######################
RUN apt-get update && apt-get install -y wget apt-transport-https

RUN wget -qO - https://apt.z.cash/zcash.asc | apt-key add -
RUN echo "deb [arch=amd64] https://apt.z.cash/ jessie main" | tee /etc/apt/sources.list.d/zcash.list
RUN apt-get update && apt-get -y install zcash
RUN mkdir -p /root/.zcash
RUN zcash-fetch-params
ADD docker/zcash.conf /root/.zcash/zcash.conf

VOLUME ["/root/.zcash"]
EXPOSE 8331

CMD zcashd -daemon -rest -conf=/root/.zcash/zcash.conf && bash
