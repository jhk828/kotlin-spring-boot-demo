# Base image
FROM openjdk:17-jdk

# Set working directory
WORKDIR /app

# Install xargs
RUN yum update -y && yum install -y findutils

# Copy build.gradle.kts and settings.gradle.kts
COPY build.gradle.kts settings.gradle.kts /app/

# Copy the Gradle wrapper files
COPY gradlew /app/
COPY gradle /app/gradle

# Download Gradle distribution
RUN ./gradlew --version

# Copy the entire project
COPY . /app

# Build the project
RUN ./gradlew build

# Run the application
CMD ["java", "-jar", "build/libs/kotlin-spring-boot-demo.jar"]