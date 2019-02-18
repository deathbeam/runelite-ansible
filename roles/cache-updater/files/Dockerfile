FROM openjdk:8-jdk-alpine
MAINTAINER Tomas Slusny <slusnucky@gmail.com>
VOLUME /tmp

ARG JAR_FILE
ADD ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
