FROM eclipse-temurin:11-jdk as builder

WORKDIR /usr/src/app

COPY pom.xml /usr/src/app
COPY ./src/test/java /usr/src/app/src/test/java

CMD mvn test