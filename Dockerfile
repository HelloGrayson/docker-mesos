FROM jpetazzo/dind
MAINTAINER Dave <goodoi09@gmail.com>

RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF

RUN apt-get -y update && apt-get -y install \
	mesos=0.21.1-1.1.ubuntu1404 \
	supervisor

ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD start-slave.sh /start-slave.sh
RUN chmod +x /start-slave.sh