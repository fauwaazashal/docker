# FROM openjdk
# COPY target/*.jar /
# EXPOSE 8080
# ENTRYPOINT ["java","-jar","/my-app-1.0-SNAPSHOT.jar"]

FROM openjdk
COPY target/*.jar /target/
EXPOSE 8080
ENTRYPOINT ["java","-jar","/target/my-app-1.0-SNAPSHOT.jar"]
