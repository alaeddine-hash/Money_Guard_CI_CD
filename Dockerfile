FROM openjdk:18
EXPOSE 8081
ADD target/Money_Guard_CI_CD.jar
ENTRYPOINT ["java", "-jar", "/Money_Guard_CI_CD.jar"]
