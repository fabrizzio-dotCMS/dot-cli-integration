FROM openjdk:11
#FROM ubuntu:22.04

ARG JAVA_PACKAGE=openjdk-11-jre-headless
ARG RUN_JAVA_VERSION=1.3.8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'
ARG RUN_DOT_CLI_VERSION='1.0.0-SNAPSHOT'

ENV USER_HOME=/root/
ENV DOT_SERVICES_HOME=${USER_HOME}.dotcms/

ENV DOT_CLI_HOME=/dot-cli/
ENV QUARKUS_LOG_FILE_PATH=${DOT_CLI_HOME}dotcms-cli.log
ENV DOT_CLI=cli-${RUN_DOT_CLI_VERSION}-runner.jar

ENV DOT_CLI_JAR = "${DOT_CLI_HOME}${DOT_CLI}"

RUN mkdir -p ${DOT_CLI_HOME}
RUN chmod 777 ${DOT_CLI_HOME}

COPY ${DOT_CLI} ${DOT_CLI_HOME}

COPY entrypoint.sh ${DOT_CLI_HOME}

#Tell the CLI to use the demo server
#The sufix value used to create the environment value must match the name on dot-service.yml file in this case we are using default
#dotcms.client.servers.default=https://demo.dotcms.com/api
ENV DOTCMS_CLIENT_SERVERS_DEFAULT=https://demo.dotcms.com/api
#now move the file into the dotcms folder located uder the user home folder
COPY dot-service.yml ${DOT_SERVICES_HOME}

ARG tkn=$1

#Replace the token with the value passed in the docker workflow action
RUN sed -i ' ' "s/token_plchldr/$tkn/g" "${DOT_SERVICES_HOME}dot-service.yml"

RUN cat "${DOT_SERVICES_HOME}dot-service.yml"


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