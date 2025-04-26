package config;

public class ConfigVNPay {
    public static final String vnp_Version = "2.1.0";
    public static final String vnp_Command = "pay";
    public static final String vnp_TmnCode = "XXXXXX"; // do VNPay cung cấp
    public static final String vnp_HashSecret = "YOUR_SECRET_KEY";
    public static final String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    public static final String vnp_ReturnUrl = "http://localhost:8080/your-web/return-vnpay";
}