FROM openjdk:18
EXPOSE 8081
ADD target/money_guard_ci_cd.jar money_guard_ci_cd.jar
ENTRYPOINT ["java", "-jar", "/money_guard_ci_cd.jar"]
