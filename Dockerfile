FROM centos:latest

MAINTAINER Sergio Perez <serperga@gmail.com>

RUN yum update -y && \
yum install -y wget

#Download Oracle JDK
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"

RUN cp jdk-7u79-linux-x64.tar.gz /opt
RUN rm -f jdk-7u79-linux-x64.tar.gz
WORKDIR /opt
#UNCOMPRESS JDK
RUN tar -xvzf jdk-7u79-linux-x64.tar.gz 
WORKDIR /opt/jdk1.7.0_79
#INSTALL JDK
RUN alternatives --install /usr/bin/java java /opt/jdk1.7.0_79/bin/java 2
RUN alternatives --install /usr/bin/jar jar /opt/jdk1.7.0_79/bin/jar 2
RUN alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_79/bin/javac 2
RUN alternatives --set jar /opt/jdk1.7.0_79/bin/jar
RUN alternatives --set javac /opt/jdk1.7.0_79/bin/javac

# Set environment variables.
ENV JAVA_HOME /opt/jdk1.7.0_79
ENV JRE_HOME /opt/jdk1.7.0_79/jre
ENV PATH "$PATH:/opt/jdk1.7.0_79/bin:/opt/jdk1.7.0_79/jre/bin"

# Define default command.
CMD ["bash"]
