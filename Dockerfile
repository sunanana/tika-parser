FROM openjdk:13

RUN yum install -y wget \
	&& mkdir /opt/tika \
	&& cd /opt/tika \
	&& wget https://archive.apache.org/dist/tika/tika-app-1.22.jar \
	&& yum remove -y wget
