FROM openjdk:8u302-jdk

WORKDIR /home

COPY gradle-7.2 /home/gradle
COPY .gradle /root/.gradle
COPY bin /home/bin

ENV GRADLE_HOME=/home/gradle
ENV GRADLE_USER_HOME=/root/.gradle
ENV PATH=${GRADLE_HOME}/bin:${PATH}
ENV APP_NAME=service-user

RUN git config --global http.sslverify "false"

ENTRYPOINT ["bin/startup.sh"]