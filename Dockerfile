# Sử dụng Tomcat 11 với JDK 17 làm base image
FROM tomcat:11-jdk17

# Xoá ứng dụng mặc định
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy WAR file từ máy host vào container, giữ tên là WebFinall.war
COPY src/main/webapp/WEB-INF/WebFinalll.war /usr/local/tomcat/webapps/WebFinalll.war
#COPY build/libs/WebFinalll.war /usr/local/tomcat/webapps/WebFinalll.war
# Mở cổng 8080 để truy cập từ bên ngoài
EXPOSE 8080

# Khởi động Tomcat
CMD ["catalina.sh", "run"]