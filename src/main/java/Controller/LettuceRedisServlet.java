package Controller;

import io.lettuce.core.RedisClient;
import io.lettuce.core.RedisURI;
import io.lettuce.core.api.StatefulRedisConnection;
import io.lettuce.core.api.sync.RedisCommands;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/lettuceTest")
public class LettuceRedisServlet extends HttpServlet {
    private static final String REDIS_HOST = "localhost"; // Thay bằng địa chỉ Redis nếu chạy trên server khác
    private static final int REDIS_PORT = 6379; // Cổng Redis
    private static final String REDIS_PASSWORD = "65906590"; // Thay bằng mật khẩu Redis của bạn

    // Kết nối Redis với mật khẩu
    private static final RedisURI redisURI = RedisURI.builder()
            .withHost(REDIS_HOST)
            .withPort(REDIS_PORT)
            .withPassword(REDIS_PASSWORD.toCharArray())
            .build();

    private static final RedisClient redisClient = RedisClient.create(redisURI);
    private static final StatefulRedisConnection<String, String> connection = redisClient.connect();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            RedisCommands<String, String> commands = connection.sync();

            // Lưu dữ liệu vào Redis
            commands.set("username", "Alice");
            String username = commands.get("username");

            resp.getWriter().println("User from Redis: " + username);
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Lỗi kết nối Redis: " + e.getMessage());
        }
    }

    @Override
    public void destroy() {
        connection.close();
        redisClient.shutdown();
    }
}
