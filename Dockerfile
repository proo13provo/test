# Sử dụng image base có JDK, không cần gradle vì ta dùng gradlew
FROM eclipse-temurin:17-jdk AS build

WORKDIR /app

# Sao chép toàn bộ project (bao gồm gradlew, gradle folder, build.gradle, settings.gradle, src, ...)
COPY . .

# Cho phép gradlew thực thi
RUN chmod +x gradlew

# Chạy build bằng wrapper
RUN ./gradlew clean build

# Image chạy Tomcat
FROM tomcat:10.1-jdk17

# Xóa app mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR từ stage build
COPY --from=build /app/build/dist/WebFinall-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
