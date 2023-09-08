FROM openjdk:11
#FROM ubuntu:22.04

ARG JAVA_PACKAGE=openjdk-11-jre-headless
ARG RUN_JAVA_VERSION=1.3.8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'
ARG RUN_DOT_CLI_VERSION='1.0.0-SNAPSHOT'

RUN mkdir -p /dot-cli
RUN chmod 777 /dot-cli

ENV DOT_CLI_HOME=/dot-cli/
ENV QUARKUS_LOG_FILE_PATH=${DOT_CLI_HOME}dotcms-cli.log
ENV DOT_CLI=cli-${RUN_DOT_CLI_VERSION}-runner.jar

ENV DOT_CLI_JAR = "${DOT_CLI_HOME}${DOT_CLI}"

COPY ${DOT_CLI} ${DOT_CLI_HOME}

COPY entrypoint.sh ${DOT_CLI_HOME}

RUN echo "DOT_CLI_HOME: ${DOT_CLI_HOME}"

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean;

RUN curl https://repo1.maven.org/maven2/io/fabric8/run-java-sh/"${RUN_JAVA_VERSION}"/run-java-sh-"${RUN_JAVA_VERSION}"-sh.sh -o "${DOT_CLI_HOME}"run-java.sh
RUN chmod 777 ${DOT_CLI_HOME}run-java.sh

ENV JAVA_OPTIONS="-Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
ENV JAVA_APP_JAR="${DOT_CLI}"
ENV JAVA_APP_NAME="dotcms-cli"

# The following are here to enable debug mode
#ENV JAVA_DEBUG="y"
#ENV JAVA_DEBUG_SUSPEND="y"
#ENV JAVA_DEBUG_PORT="5005"
#EXPOSE 5005

# Code file to execute when the docker container starts up (`entrypoint.sh`)

ENTRYPOINT ["/dot-cli/entrypoint.sh"]