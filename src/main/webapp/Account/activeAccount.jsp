<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 4/4/25
  Time: 07:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Xác thực tài khoản | Tên Ứng Dụng</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    :root {
      --primary-color: #4361ee;
      --primary-hover: #3a56d4;
      --secondary-color: #7209b7;
      --success-color: #4cc9f0;
      --error-color: #f72585;
      --text-color: #2b2d42;
      --light-gray: #f8f9fa;
      --border-radius: 12px;
      --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
      --transition: all 0.3s ease;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Inter', sans-serif;
      background-color: var(--light-gray);
      color: var(--text-color);
      line-height: 1.6;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
      background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    }

    .auth-card {
      background: white;
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      width: 100%;
      max-width: 500px;
      overflow: hidden;
      transition: var(--transition);
    }

    .card-header {
      background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
      color: white;
      padding: 25px;
      text-align: center;
      position: relative;
      overflow: hidden;
    }

    .card-header::before {
      content: "";
      position: absolute;
      top: -50%;
      right: -50%;
      width: 100%;
      height: 200%;
      background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
      transform: rotate(30deg);
    }

    .card-header h1 {
      font-size: 1.8rem;
      font-weight: 600;
      margin-bottom: 5px;
      position: relative;
    }

    .card-header p {
      opacity: 0.9;
      font-size: 0.95rem;
      position: relative;
    }

    .card-body {
      padding: 30px;
    }

    .logo {
      margin-bottom: 20px;
      text-align: center;
    }

    .logo img {
      height: 50px;
    }

    .auth-methods {
      display: flex;
      flex-direction: column;
      gap: 15px;
      margin-bottom: 25px;
    }

    .method-card {
      border: 2px solid #e9ecef;
      border-radius: var(--border-radius);
      padding: 20px;
      cursor: pointer;
      transition: var(--transition);
      position: relative;
      overflow: hidden;
    }

    .method-card:hover {
      border-color: var(--primary-color);
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    }

    .method-card.active {
      border-color: var(--primary-color);
      background-color: rgba(67, 97, 238, 0.05);
    }

    .method-card input[type="radio"] {
      position: absolute;
      opacity: 0;
      width: 0;
      height: 0;
    }

    .method-header {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    }

    .method-icon {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background-color: rgba(67, 97, 238, 0.1);
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 15px;
      color: var(--primary-color);
      font-size: 1.2rem;
    }

    .method-title {
      font-weight: 600;
      font-size: 1.1rem;
    }

    .method-desc {
      font-size: 0.9rem;
      color: #6c757d;
      padding-left: 55px;
    }

    .form-group {
      margin-bottom: 20px;
      position: relative;
      display: none;
    }

    .form-group.active {
      display: block;
      animation: fadeIn 0.3s ease;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
      font-size: 0.95rem;
    }

    .input-icon {
      position: relative;
    }

    .input-icon input {
      width: 100%;
      padding: 14px 14px 14px 45px;
      border: 2px solid #e9ecef;
      border-radius: var(--border-radius);
      font-size: 1rem;
      transition: var(--transition);
    }

    .input-icon input:focus {
      border-color: var(--primary-color);
      outline: none;
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
    }

    .input-icon i {
      position: absolute;
      left: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #adb5bd;
      font-size: 1.1rem;
    }

    .btn {
      width: 100%;
      padding: 14px;
      border: none;
      border-radius: var(--border-radius);
      background: var(--primary-color);
      color: white;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: var(--transition);
      margin-top: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .btn:hover {
      background: var(--primary-hover);
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
    }

    .btn:active {
      transform: translateY(0);
    }

    .btn i {
      margin-right: 8px;
    }

    .alert {
      padding: 15px;
      border-radius: var(--border-radius);
      margin-bottom: 20px;
      font-size: 0.95rem;
      display: flex;
      align-items: center;
    }

    .alert i {
      margin-right: 10px;
      font-size: 1.2rem;
    }

    .alert-info {
      background-color: rgba(67, 97, 238, 0.1);
      border-left: 4px solid var(--primary-color);
      color: var(--primary-color);
    }

    .alert-success {
      background-color: rgba(76, 201, 240, 0.1);
      border-left: 4px solid var(--success-color);
      color: #0a9396;
    }

    .alert-error {
      background-color: rgba(247, 37, 133, 0.1);
      border-left: 4px solid var(--error-color);
      color: var(--error-color);
    }

    .footer-text {
      text-align: center;
      margin-top: 20px;
      font-size: 0.9rem;
      color: #6c757d;
    }

    .footer-text a {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 500;
    }

    .footer-text a:hover {
      text-decoration: underline;
    }

    .otp-container {
      display: flex;
      justify-content: center;
      gap: 10px;
      margin-bottom: 20px;
    }

    .otp-input {
      width: 50px;
      height: 60px;
      text-align: center;
      font-size: 1.5rem;
      border: 2px solid #e9ecef;
      border-radius: 8px;
      transition: var(--transition);
    }

    .otp-input:focus {
      border-color: var(--primary-color);
      outline: none;
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
    }

    .resend-link {
      text-align: center;
      margin-top: 15px;
      font-size: 0.9rem;
    }

    .resend-link a {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 500;
      cursor: pointer;
    }

    .resend-link a:hover {
      text-decoration: underline;
    }

    .timer {
      color: #6c757d;
      font-weight: 500;
    }

    @media (max-width: 576px) {
      .auth-card {
        border-radius: 0;
        box-shadow: none;
      }

      body {
        padding: 0;
        background: white;
      }

      .method-card {
        padding: 15px;
      }

      .method-icon {
        width: 35px;
        height: 35px;
        font-size: 1rem;
        margin-right: 10px;
      }
    }
  </style>
</head>
<body>
<div class="auth-card">
  <div class="card-header">
    <h1>Xác Thực Tài Khoản</h1>
    <p>Vui lòng chọn phương thức xác thực để hoàn tất đăng ký</p>
  </div>

  <div class="card-body">
    <div class="logo">
      <!-- Thay bằng logo của bạn -->
      <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 0C5.373 0 0 5.373 0 12s5.373 12 12 12 12-5.373 12-12S18.627 0 12 0zm0 22c-5.523 0-10-4.477-10-10S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10z" fill="#4361ee"/>
        <path d="M12 5c-3.866 0-7 3.134-7 7s3.134 7 7 7 7-3.134 7-7-3.134-7-7-7zm0 12c-2.761 0-5-2.239-5-5s2.239-5 5-5 5 2.239 5 5-2.239 5-5 5z" fill="#4361ee"/>
        <path d="M12 8c-2.209 0-4 1.791-4 4s1.791 4 4 4 4-1.791 4-4-1.791-4-4-4zm0 6c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z" fill="#4361ee"/>
      </svg>
    </div>

    <%-- Hiển thị thông báo --%>
    <%
      String error = request.getParameter("error");
      String success = request.getParameter("success");
      String email = (String) session.getAttribute("emailForVerification");

      if (error != null) {
    %>
    <div class="alert alert-error">
      <i class="fas fa-exclamation-circle"></i>
      <div>
        <%
          if (error.equals("1")) {
            out.println("Mã OTP không chính xác. Vui lòng thử lại.");
          } else if (error.equals("2")) {
            out.println("Mã xác nhận không hợp lệ hoặc đã hết hạn.");
          } else if (error.equals("3")) {
            out.println("Đã xảy ra lỗi khi gửi mã xác nhận. Vui lòng thử lại.");
          }
        %>
      </div>
    </div>
    <% } else if (success != null && success.equals("1")) { %>
    <div class="alert alert-success">
      <i class="fas fa-check-circle"></i>
      <div>
        Mã xác nhận đã được gửi thành công! Vui lòng kiểm tra email của bạn.
      </div>
    </div>
    <% } else { %>
    <div class="alert alert-info">
      <i class="fas fa-info-circle"></i>
      <div>
        Vui lòng xác thực tài khoản để tiếp tục sử dụng dịch vụ.
        <% if (email != null) { %>
        Mã xác nhận sẽ được gửi đến <strong><%= email %></strong>.
        <% } %>
      </div>
    </div>
    <% } %>

    <form id="verificationForm" action="VerifyAccountServlet" method="post">
      <div class="auth-methods">
        <label class="method-card" id="otpMethod">
          <input type="radio" name="verificationMethod" value="otp" checked>
          <div class="method-header">
            <div class="method-icon">
              <i class="fas fa-mobile-alt"></i>
            </div>
            <div class="method-title">Xác thực bằng OTP</div>
          </div>
          <div class="method-desc">
            Nhận mã OTP 6 chữ số qua SMS để xác thực tài khoản
          </div>
        </label>

        <label class="method-card" id="emailMethod">
          <input type="radio" name="verificationMethod" value="email">
          <div class="method-header">
            <div class="method-icon">
              <i class="fas fa-envelope"></i>
            </div>
            <div class="method-title">Xác thực qua Email</div>
          </div>
          <div class="method-desc">
            Nhận liên kết xác thực qua email để kích hoạt tài khoản
          </div>
        </label>
      </div>

      <!-- OTP Verification Form -->
      <div class="form-group active" id="otpForm">
        <div class="otp-container">
          <input type="text" class="otp-input" name="otp1" maxlength="1" pattern="[0-9]" inputmode="numeric" autocomplete="one-time-code" required>
          <input type="text" class="otp-input" name="otp2" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
          <input type="text" class="otp-input" name="otp3" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
          <input type="text" class="otp-input" name="otp4" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
          <input type="text" class="otp-input" name="otp5" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
          <input type="text" class="otp-input" name="otp6" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
        </div>
        <input type="hidden" name="fullOtp" id="fullOtp">

        <div class="resend-link">
          Không nhận được mã? <a id="resendOtp">Gửi lại mã OTP</a>
          <span class="timer" id="otpTimer">(60s)</span>
        </div>

        <button type="submit" class="btn" name="verifyAction" value="verifyOtp">
          <i class="fas fa-check-circle"></i> Xác Thực OTP
        </button>
      </div>

      <!-- Email Verification Form -->
      <div class="form-group" id="emailForm">
        <div class="input-icon">
          <i class="fas fa-envelope"></i>
          <input type="email" name="email" id="verifyEmail"
                 value="<%= email != null ? email : "" %>"
                 placeholder="Email nhận mã xác thực" required>
        </div>

        <div class="resend-link">
          Không nhận được email? <a id="resendEmail">Gửi lại email xác thực</a>
          <span class="timer" id="emailTimer">(60s)</span>
        </div>

        <button type="button" class="btn" id="sendEmailBtn">
          <i class="fas fa-paper-plane"></i> Gửi Liên Kết Xác Thực
        </button>

        <div id="emailStatus" class="mt-2" style="display:none;"></div>
      </div>
    </form>

    <div class="footer-text">
      Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a>
    </div>
  </div>
</div>

<script>
  // Xử lý chuyển đổi giữa các phương thức xác thực
  const otpMethod = document.getElementById('otpMethod');
  const emailMethod = document.getElementById('emailMethod');
  const otpForm = document.getElementById('otpForm');
  const emailForm = document.getElementById('emailForm');

  otpMethod.addEventListener('click', function() {
    otpMethod.classList.add('active');
    emailMethod.classList.remove('active');
    otpForm.classList.add('active');
    emailForm.classList.remove('active');
  });

  emailMethod.addEventListener('click', function() {
    emailMethod.classList.add('active');
    otpMethod.classList.remove('active');
    emailForm.classList.add('active');
    otpForm.classList.remove('active');
  });

  // Xử lý nhập OTP tự động chuyển focus
  const otpInputs = document.querySelectorAll('.otp-input');
  const fullOtpField = document.getElementById('fullOtp');

  otpInputs.forEach((input, index) => {
    input.addEventListener('input', function() {
      if (this.value.length === 1) {
        if (index < otpInputs.length - 1) {
          otpInputs[index + 1].focus();
        }
      }

      // Cập nhật full OTP
      let fullOtp = '';
      otpInputs.forEach(otp => {
        fullOtp += otp.value;
      });
      fullOtpField.value = fullOtp;
    });

    input.addEventListener('keydown', function(e) {
      if (e.key === 'Backspace' && this.value.length === 0 && index > 0) {
        otpInputs[index - 1].focus();
      }
    });
  });

  // Đếm ngược thời gian gửi lại OTP/Email
  function startTimer(timerElement, seconds) {
    let remaining = seconds;
    timerElement.textContent = `(${remaining}s)`;
    timerElement.style.display = 'inline';

    const interval = setInterval(() => {
      remaining--;
      timerElement.textContent = `(${remaining}s)`;

      if (remaining <= 0) {
        clearInterval(interval);
        timerElement.style.display = 'none';
      }
    }, 1000);

    return interval;
  }

  const otpTimer = document.getElementById('otpTimer');
  const emailTimer = document.getElementById('emailTimer');
  const resendOtp = document.getElementById('resendOtp');
  const resendEmail = document.getElementById('resendEmail');

  // Khởi tạo timer
  let otpTimerInterval = startTimer(otpTimer, 60);
  let emailTimerInterval = startTimer(emailTimer, 60);

  // Xử lý gửi lại OTP
  resendOtp.addEventListener('click', function() {
    if (otpTimer.style.display === 'none' || otpTimer.textContent === '(0s)') {
      fetch('ResendOtpServlet', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'action=resendOtp'
      })
              .then(response => response.json())
              .then(data => {
                if (data.success) {
                  alert('Mã OTP mới đã được gửi!');
                  clearInterval(otpTimerInterval);
                  otpTimerInterval = startTimer(otpTimer, 60);
                } else {
                  alert('Có lỗi xảy ra khi gửi lại OTP: ' + data.message);
                }
              })
              .catch(error => {
                console.error('Error:', error);
                alert('Có lỗi xảy ra khi gửi lại OTP');
              });
    }
  });

  // Xử lý gửi lại Email


  // Tự động focus vào ô OTP đầu tiên
  if (otpForm.classList.contains('active')) {
    otpInputs[0].focus();
  }
</script>
<script>
  $(document).ready(function() {
    // Xử lý khi click nút gửi email
    $('#sendEmailBtn').click(function() {
      const email = $('#verifyEmail').val();

      if (!email) {
        alert('Vui lòng nhập email');
        return;
      }

      $('#emailStatus').html('<i class="fas fa-spinner fa-spin"></i> Đang gửi email...').show();

      // Gửi AJAX request
      $.ajax({
        url: '${pageContext.request.contextPath}/activeAccount',
        type: 'POST',
        data: { email: email },
        success: function(response) {
          if (response.success) {
            $('#emailStatus').html('<i class="fas fa-check-circle text-success"></i> ' + response.message).show();
            startEmailTimer(); // Bắt đầu đếm ngược
          } else {
            $('#emailStatus').html('<i class="fas fa-times-circle text-danger"></i> ' + response.message).show();
          }
        },
        error: function() {
          $('#emailStatus').html('<i class="fas fa-times-circle text-danger"></i> Lỗi kết nối, vui lòng thử lại').show();
        }
      });
    });

    // Xử lý khi click gửi lại email
    $('#resendEmail').click(function() {
      if ($('#emailTimer').text() === '(0s)' || $('#emailTimer').css('display') === 'none') {
        $('#sendEmailBtn').click(); // Kích hoạt gửi lại
      }
    });

    // Hàm đếm ngược thời gian
    function startEmailTimer() {
      let timeLeft = 60;
      const timerElement = $('#emailTimer');
      timerElement.text('(' + timeLeft + 's)').show();

      const interval = setInterval(function() {
        timeLeft--;
        timerElement.text('(' + timeLeft + 's)');

        if (timeLeft <= 0) {
          clearInterval(interval);
          timerElement.hide();
        }
      }, 1000);
    }
  });
</script>
</body>
</html>