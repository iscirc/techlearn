FROM eclipse-temurin:25-jdk
WORKDIR /app
COPY . .
RUN chmod +x gradlew && ./gradlew bootJar -x test
CMD ["sh", "-c", "java -jar build/libs/*.jar"]