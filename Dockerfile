#FROM openjdk:8-jdk-alpine
FROM openjdk:8u212-jdk
COPY target/*SNAPSHOT.jar app.jar
EXPOSE 8080
#ENTRYPOINT ["java", "-Xnx400M", "-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar","--spring.profiles.active=docker"]
ENTRYPOINT ["java","-jar", "/app.jar"]
# -D option : 시스템 설정 변경
# --spring option : application.yaml 파일의 설정값 변경

# FROM
# Docker는 여러개의 layer로 구성되어있어 base image를 선택해야한다.
# 위의 설정은 java8의 이미지를 가져왔다.
# 일반적으로 컨테이너 환경에서의 image는 alpine 이미지를 사용하라고 추천한다.
# 알파인 리눅스는 작고 가볍지만, stackdriver가 alpine 이미지에서 제대로 tracing이 되지 않아 일반 형태로 이미지를 설정하였다.

# COPY
# Spring boot 프로젝트가 build되면 target 아래쪽으로 class 파일 및 jar 파일이 생성된다.
# 실제로 run을 하는 파일은 jar 파일이기 때문에 해당 파일을 from 절에 있는 image로 copy하는 작업이 필요하다.

# EXPOSE
# Docker를 실행할 때는 port를 연결하여 주어야 한다. 보통 내부포트:외부포트 형식으로 설정하지만,
# 두개의 포트가 같은경우 포트번호 하나로 설정이 가능하다.

# ENTRYPOINT
# DOCKER를 run 할때 실행옵션이다. Jar 파일을 실행시키려면 java -jar 형식으로 실행하는 옵션을 배열형식으로 적으면 된다.
# Shell 에서는 -D 옵션으로 시스템의 설정을 변경할 수 있고, --spring 옵션으로 springboot를 실행 시ㅣ, application./yaml 파일의 설정값을 변경시킬 수 있다.