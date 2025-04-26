package Services;

import io.lettuce.core.RedisClient;
import io.lettuce.core.RedisURI;
import io.lettuce.core.api.StatefulRedisConnection;
import io.lettuce.core.api.sync.RedisCommands;

public class RedisOTPService {
    private static final String REDIS_HOST = "localhost";
    private static final int REDIS_PORT = 6379;
    private static final String REDIS_PASSWORD = ""; // Thay bằng mật khẩu Redis của bạn

    private static final RedisURI redisURI = RedisURI.builder()
            .withHost(REDIS_HOST)
            .withPort(REDIS_PORT)
            .withPassword(REDIS_PASSWORD.toCharArray())
            .build();

    private static final RedisClient redisClient = RedisClient.create(redisURI);
    private static final StatefulRedisConnection<String, String> connection = redisClient.connect();
    private static final RedisCommands<String, String> commands = connection.sync();

    // Lưu OTP vào Redis với thời gian sống (TTL)
    public void saveToken(String email, String token, int ttlSeconds) {
        String key = "otp:" + email; // Key duy nhất cho mỗi email
        commands.setex(key, ttlSeconds, token); // Lưu OTP với thời gian sống
    }

    // Lấy OTP từ Redis
    public String getToken(String email) {
        String key = "otp:" + email;
        return commands.get(key); // Trả về OTP hoặc null nếu hết hạn
    }

    // Xóa OTP sau khi sử dụng
    public void deleteToken(String email) {
        String key = "otp:" + email;
        commands.del(key);
    }

    // Đóng kết nối Redis
    public static void close() {
        connection.close();
        redisClient.shutdown();
    }
}