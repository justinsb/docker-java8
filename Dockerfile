FROM ubuntu:14.04

RUN apt-get update && apt-get install --yes --no-install-recommends wget openssl ca-certificates

RUN cd /tmp \
    && wget -qO jdk8.tar.gz \
       --header "Cookie: oraclelicense=accept-securebackup-cookie" \
       http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jdk-8u40-linux-x64.tar.gz?AuthParam=1427051957_63cd41fb509a8b9ebc475e53a46d7e43 \
    && tar xzf jdk8.tar.gz -C /opt \
    && mv /opt/jdk* /opt/java \
    && rm /tmp/jdk8.tar.gz \
    && update-alternatives --install /usr/bin/java java /opt/java/bin/java 100 \
    && update-alternatives --install /usr/bin/javac javac /opt/java/bin/javac 100

RUN apt-get install --yes --no-install-recommends maven
