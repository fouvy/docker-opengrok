FROM tomcat:9.0
RUN mkdir /src
RUN mkdir /data
RUN mkdir /var/opengrok
RUN mkdir /var/opengrok/etc
RUN mkdir /var/opengrok/log
RUN ln -s /data /var/opengrok
RUN ln -s /src /var/opengrok
RUN wget "https://github.com/OpenGrok/OpenGrok/releases/download/1.0/opengrok-1.0.tar.gz" -O /tmp/opengrok-1.0.tar.gz
RUN wget "http://ftp.us.debian.org/debian/pool/main/e/exuberant-ctags/exuberant-ctags_5.9~svn20110310-8_amd64.deb" -O /tmp/exuberant-ctags_5.9-svn20110310-8_amd64.deb
RUN tar zxvf /tmp/opengrok-1.0.tar.gz -C /
RUN dpkg -i /tmp/exuberant-ctags_5.9-svn20110310-8_amd64.deb

RUN apt-get update
RUN apt-get install -y procps

ENV SRC_ROOT /src
#ENV DATA_ROOT /data
ENV OPENGROK_TOMCAT_BASE /usr/local/tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV PATH /opengrok-1.0/bin:$PATH
#ENV LANG zh_CN.gb2312

ENV CATALINA_BASE /usr/local/tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV CATALINA_TMPDIR /usr/local/tomcat/temp
ENV JRE_HOME /usr
ENV CLASSPATH /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar

WORKDIR $CATALINA_HOME
RUN /opengrok-1.0/bin/OpenGrok deploy

EXPOSE 8080
ADD scripts /scripts
CMD ["/scripts/start.sh"]
