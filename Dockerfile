FROM maven:3.9.5-sapmachine-17 as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package

FROM openjdk:22-slim-bullseye
COPY --from=builder /app/target/*.jar /app/application.jar
ENTRYPOINT ["java","-jar","/app/application.jar"]