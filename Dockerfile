FROM eclipse-temurin:25-jdk
WORKDIR /app
COPY backend/techlearn-api/ .
RUN chmod +x gradlew && ./gradlew bootJar -x test
EXPOSE 8080
CMD ["sh", "-c", "java -jar build/libs/*.jar"]
