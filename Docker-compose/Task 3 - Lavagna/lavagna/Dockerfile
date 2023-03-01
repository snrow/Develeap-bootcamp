FROM maven:3.8.6-openjdk-8 AS builder
WORKDIR /project
COPY ./project/ /project/
RUN mvn verify
RUN apt update
#RUN apt install default-mysql-client -y
RUN apt install npm -y
RUN npm install


FROM eclipse-temurin:8-jre-alpine
WORKDIR /project/
COPY --from=builder /project /project
RUN apk update 
COPY entrypoint.sh / 
ENTRYPOINT [ "/bin/sh","/entrypoint.sh" ]