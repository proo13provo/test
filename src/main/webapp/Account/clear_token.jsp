<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 22/3/25
  Time: 07:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>Đang đăng xuất...</p>

</body>
<script>
    window.onload = function () {
        // Xóa access_token khỏi URL bằng cách chuyển hướng về login.jsp
        sessionStorage.removeItem("token_sent");
        window.location.replace("login.jsp");

    };
</script>
</html>
