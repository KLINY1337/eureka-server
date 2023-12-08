FROM eclipse-temurin:21-jdk-alpine

RUN apk add --no-cache bash procps curl tar

# common for all images
ENV MAVEN_HOME /usr/share/maven

COPY --from=maven:3.9.5-eclipse-temurin-11 ${MAVEN_HOME} ${MAVEN_HOME}
COPY --from=maven:3.9.5-eclipse-temurin-11 /usr/local/bin/mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
COPY --from=maven:3.9.5-eclipse-temurin-11 /usr/share/maven/ref/settings-docker.xml /usr/share/maven/ref/settings-docker.xml

RUN ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn

ARG MAVEN_VERSION=3.9.5
ARG USER_HOME_DIR="/root"
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]

WORKDIR /app

COPY pom.xml .
#COPY src/main/resources/eureka-server.crt /app/
##COPY src/main/resources/eureka-server.crt /certificates
COPY src ./src
#RUN keytool -import -noprompt -trustcacerts -alias eureka-server -file eureka-server.crt -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit
##RUN keytool -importcert -alias eureka-server -keystore /opt/java/openjdk/lib/security/cacerts -file eureka-server.crt
#WORKDIR /
#RUN bash __cacert_entrypoint.sh

WORKDIR /app
RUN mvn clean package -Dmaven.test.skip

EXPOSE 8761
EXPOSE 443

CMD ["java", "-jar", "/app/target/eureka-server-v1.jar"]