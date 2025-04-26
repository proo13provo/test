package Services;

import java.security.SecureRandom;
import java.util.Base64;

public class TokenService {
    public static String generateSecureToken() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[64];
        random.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }

    public static void main(String[] args) {
        System.out.println(generateSecureToken());
    }
}
