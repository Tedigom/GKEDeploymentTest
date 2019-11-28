#FROM openjdk:8-jdk-alpine
FROM openjdk:8u212-jdk
COPY target/*SNAPSHOT.jar app.jar
EXPOSE 8080
#ENTRYPOINT ["java", "-Xnx400M", "-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar","--spring.profiles.active=docker"]
ENTRYPOINT ["java","-jar", "/app.jar"]
# -D option : 시스템 설정 변경
# --spring option : application.yaml 파일의 설정값 변경

