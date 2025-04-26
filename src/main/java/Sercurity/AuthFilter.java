package Sercurity;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebFilter("/admin/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String path = req.getRequestURI();
        path = path.replaceFirst("^/WebFinall", "");
        System.out.println(path.startsWith("/admin") + path);
        if (path.startsWith("/checkLogin") || path.startsWith("/callback")) {
            chain.doFilter(request, response);
            return;
        }
        HttpSession session = req.getSession(false);
        String token = (session != null) ? (String) session.getAttribute("authToken") : null;
if (token != null) {
    try {
        Claims claims = JwtUtil.extractClaims(token);
        String role = claims.get("role", String.class);
        System.out.println("Token validation successful - Role: " + role);
        
        if (path.startsWith("/admin") && !"ROLE_Admin".equals(role)) {
            if (!res.isCommitted()) {
                res.setStatus(HttpServletResponse.SC_FORBIDDEN);
                res.getWriter().write("403 - Chỉ Admin mới vào được");
            }
            return;
        }
        chain.doFilter(request, response);
        return;
    } catch (ExpiredJwtException e) {
        System.out.println("Token đã hết hạn: " + e.getMessage());
        if (!res.isCommitted()) {
            res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            res.getWriter().write("401 - Token đã hết hạn, vui lòng đăng nhập lại");
        }
        return;
    } catch (Exception e) {
        System.out.println("Lỗi xác thực token: " + e.getMessage());
        if (!res.isCommitted()) {
            res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            res.getWriter().write("401 - Token không hợp lệ hoặc hết hạn");
        }
        return;
    }
}
        if (!res.isCommitted()) {
            res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            res.getWriter().write("401 - Chưa đăng nhập hoặc thiếu token trong session");
        }
    }
}
