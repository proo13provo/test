package Sercurity;
import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import java.util.Date;
import java.security.Key;


public class JwtUtil {
    private static final String SECRET_KEY = "eyJyb2xlIjoiU3RhZmYiLCJzdWIiOiJhc2Rhc2QiLCJpYXQiOTSBDSHDE5NjIyNjcsImV4cCI6MTc0MTk2NTg2N30";

    private static final Key key = Keys.hmacShaKeyFor(SECRET_KEY.getBytes());

    public static String generateToken(String email, String role) {
        return Jwts.builder()
                .setSubject(email)
                .claim("role", "ROLE_" + role) 
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 60))
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }


    public static Claims extractClaims(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(key)
                .build()
                .parseClaimsJws(token)
                .getBody();
    }
    public static String getUsernameFromToken(String token) {
        Claims claims = extractClaims(token);
        return claims.getSubject();
    }

    public static String extractRole(String token) {
        return extractClaims(token).get("role", String.class);
    }

    public static boolean isTokenValid(String token) {
        try {
            extractClaims(token);
            return true;
        } catch (ExpiredJwtException e) {
            System.out.println("Token hết hạn");
        } catch (UnsupportedJwtException e) {
            System.out.println("Token không hỗ trợ");
        } catch (MalformedJwtException e) {
            System.out.println("Token sai định dạng");
        } catch (SignatureException e) {
            System.out.println("Sai chữ ký");
        } catch (Exception e) {
            System.out.println("Lỗi khác: " + e.getMessage());
        }
        return false;
    }
    public static String generateRefreshToken(String email) {
        return Jwts.builder()
                .setSubject(email)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 24 * 7))
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    public static void main(String[] args) {
        String r = extractRole("eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoYWNhb3RhbnRydW9uZzEyMzRAZ21haWwuY29tIiwicm9sZSI6IlJPTEVfQWRtaW4iLCJpYXQiOjE3NDQyOTgxMDgsImV4cCI6MTc0NDMwMTcwOH0.fRrRRX857aB_jfS_8BtJRWCoBu3Rn0D3W21ya31dWXo");
        System.out.println(r);
    }

}
