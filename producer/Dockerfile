FROM openjdk:8
MAINTAINER Jannik Weichert <j.weichert@hochzehn.com>
EXPOSE 8080 5005

ENV JAVA_OPTS="-Duser.timezone=Europe/Berlin -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
CMD exec java $JAVA_OPTS -jar /app/boot-app.jar

ENV COMMIT_ID=@COMMIT_ID@
ENV BUILD_ID=@BUILD_ID@
ENV BUILD_DATE=@BUILD_DATE@
ENV BUILD_URL=@BUILD_URL@
ENV BUILD_TAG=@BUILD_TAG@

ADD build/libs/producer-0.0.1-SNAPSHOT.jar /app/boot-app.jar
