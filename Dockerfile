# Use the official OpenJDK image as the parent image
FROM openjdk:18

# Set the working directory to /app
WORKDIR /app

# Copy the Maven Wrapper files
COPY .mvn .mvn

# Copy the Project Object Model (POM) file
COPY pom.xml .

# Build all the dependencies in preparation to go offline.
# This is a separate step so that Docker will cache the dependencies if unchanged.
RUN ./mvnw -N io.takari:maven:wrapper
RUN ./mvnw dependency:go-offline -B

# Copy the project source
COPY src src

# Package the application
RUN ./mvnw package -DskipTests

# Expose port 8081 (adjust as needed)
EXPOSE 8081

# The application's JAR file is located at /app/target/money_guard_ci_cd.jar
ENTRYPOINT ["java", "-jar", "target/money_guard_ci_cd.jar"]
