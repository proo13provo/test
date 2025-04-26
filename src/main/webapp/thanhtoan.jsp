<%@ page import="Models.cart.Cart" %>
<%@ page import="Models.Shipping.Shipping" %>
<%@ page import="Services.ServiceShipping" %>
<%@ page import="java.util.List" %>
<%@ page import="Models.Shipping.Shippingdetail" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 15/12/2024
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thanhtoan</title>
  <link rel="stylesheet" href="css/styleThanhtoan.css">
  <link rel="stylesheet" href="css/shoppingcart.css">
  <link rel="stylesheet" href="css/pay.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script src="https://esgoo.net/scripts/jquery.js"></script>


  <link rel="stylesheet" href="css/fontawesome.css">
  <link rel="stylesheet" href="css/templatemo-space-dynamic.css">
  <link rel="stylesheet" href="css/animated.css">
  <link rel="stylesheet" href="css/owl.css">
</head>
<style>
  .progress-header {
    background-color: #f8f8f8;
    padding: 20px 0;
    display: flex;
    justify-content: center;
  }

  /* Step Container */
  .step-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 80%;
    max-width: 800px;
  }

  /* Step Item */
  .step {
    display: flex;
    flex-direction: column;
    align-items: center;
    flex: 1;
    position: relative;
  }

  .step-icon {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: #ddd;
    color: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: bold;
    font-size: 1rem;
    transition: all 0.3s ease;
  }

  .step-text {
    margin-top: 8px;
    font-size: 0.9rem;
    color: #888;
    text-transform: uppercase;
    font-weight: 600;
  }

  /* Line Between Steps */
  .step-line {
    height: 2px;
    background-color: #ddd;
    flex: 1;
  }

  /* Active Step */
  .step.active .step-icon {
    background-color: #ff7b00; /* Màu cam nổi bật */
  }

  .step.active .step-text {
    color: #ff7b00; /* Màu cam cho text */
  }
  body {
    background-color: #f8f9fa;
  }
  .order-summary-card, .payment-info-card {
    border: none;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
  }
  .order-summary-header, .payment-info-header {
    background-color: #6c5ce7;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    border-radius: 10px 10px 0 0;
    padding: 15px;
  }
  .product-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px dashed #ccc;
    padding: 10px 0;
  }
  .product-details img {
    width: 50px;
    height: 50px;
    margin-right: 15px;
  }
  .total-section {
    font-weight: bold;
    color: #2c3e50;
    font-size: 18px;
  }
  .container {
    max-width: 100%; /* Ví dụ: chỉnh max-width phù hợp với giao diện */
    margin: 0 0; /* Canh giữa */
    height: 200px;
  }


  .btn-payment {
    background-color: #ff7b00;
    color: white;
    width: 100%;
    font-size: 18px;
    padding: 12px 0;
    border: none;
    border-radius: 25px;
    transition: background-color 0.3s ease, transform 0.2s ease;
  }

  .btn-payment:hover {
    background-color: #e67e22;
    transform: scale(1.05);
  }
  .shipping-options {
    display: flex;
    flex-direction: column;
    gap: 10px; /* Khoảng cách giữa các ô */
  }

  .shipping-option {
    display: flex;
    align-items: center;
    background: #f9f9f9; /* Màu nền nhạt */
    border: 2px solid #ddd; /* Viền nhẹ */
    border-radius: 12px; /* Bo góc */
    padding: 12px 16px;
    cursor: pointer;
    transition: all 0.3s ease;
  }

  .shipping-option:hover {
    background: #ececec; /* Hiệu ứng hover */
    border-color: #8a2be2; /* Viền tím nhẹ */
  }

  .shipping-option input {
    margin-right: 10px;
    transform: scale(1.2);
    accent-color: #8a8a8a; /* Màu radio */
  }

  .shipping-text {
    font-size: 16px;
    font-weight: 500;
    color: #333;
  }
  .shipping-options {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  .shipping-option {
    display: flex;
    align-items: center;
    background: #fff;
    border: 2px solid #ccc;
    border-radius: 16px;
    padding: 14px 18px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
    box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.1);
    position: relative;
  }
  select {
    max-height: 300px; /* Giới hạn chiều cao */
    overflow-y: auto;  /* Hiện thanh cuộn khi dài quá */
  }
  .shipping-option:hover {
    background: #f3e5ff; /* Màu nhạt tím */
    border-color: #616161;
  }

  .shipping-option input {
    display: none; /* Ẩn radio mặc định */
  }

  .shipping-content {
    display: flex;
    flex-direction: column;
    gap: 4px;
    font-size: 16px;
    font-weight: 500;
    color: #333;
  }

  .shipping-title {
    font-size: 17px;
    font-weight: bold;
  }

  .shipping-price {
    font-size: 14px;
    color: #666;
  }

  /* Khi được chọn, đổi màu viền và thêm hiệu ứng */
  .shipping-option input:checked + .shipping-content {
    color: #da4338;
    font-weight: bold;
  }

  /* Hiệu ứng bo tròn cho radio button */
  .shipping-option::before {
    content: "";
    position: absolute;
    left: 10px;
    width: 20px;
    height: 20px;
    border: 2px solid #7a7a7a;
    border-radius: 50%;
    background: #fff;
    transition: all 0.3s ease-in-out;
  }

  .shipping-option input:checked + .shipping-content::before {
    background: #6e6d6e;
  }
  /* Container cho ô nhập mã giảm giá */
  .shipping-discount {
    display: flex;
    align-items: center;
    margin-top: 15px;
    gap: 10px;
  }

  /* Ô nhập mã giảm giá */
  .shipping-discount input {
    flex: 1;
    padding: 10px;
    border: 2px solid #ccc;
    border-radius: 12px;
    font-size: 16px;
    outline: none;
    transition: 0.3s ease-in-out;
  }

  /* Khi focus vào ô nhập */
  .shipping-discount input:focus {
    border-color: #868686;
    box-shadow: 0 0 8px rgba(138, 43, 226, 0.3);
  }

  /* Nút Áp dụng */
  .shipping-discount button {
    padding: 10px 15px;
    background: linear-gradient(135deg, #f46868, #f75932);
    color: #fff;
    border: none;
    border-radius: 12px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
  }

  /* Hiệu ứng khi hover vào nút */
  .shipping-discount button:hover {
    background: linear-gradient(135deg, #6a0dad, #4b0082);
  }
  .modern-discount {
    font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
    max-width: 500px;
    margin: 0 auto;
    padding: 24px;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
  }

  .discount-title {
    font-size: 1.5rem;
    font-weight: 700;
    color: #2d3436;
    margin-bottom: 4px;
  }

  .discount-subtitle {
    font-size: 0.9rem;
    color: #636e72;
    margin-bottom: 20px;
  }

  .discount-selector {
    position: relative;
    margin-bottom: 16px;
  }

  .selector-header {
    display: flex;
    align-items: center;
    padding: 14px 16px;
    background: #f5f6fa;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.2s ease;
  }

  .selector-header:hover {
    background: #e9ecef;
  }

  .selector-icon {
    margin-right: 12px;
    font-size: 1.2rem;
  }

  .selector-text {
    flex-grow: 1;
    font-weight: 500;
    color: #2d3436;
  }

  .selector-arrow {
    transition: transform 0.3s ease;
  }

  .discount-dropdown {
    display: none;
    position: absolute;
    width: 100%;
    max-height: 300px;
    overflow-y: auto;
    background: white;
    border-radius: 8px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    z-index: 10;
    margin-top: 8px;
  }

  .discount-card {
    padding: 16px;
    border-bottom: 1px solid #f1f2f6;
    cursor: pointer;
    transition: background 0.2s ease;
  }

  .discount-card:hover {
    background: #f8f9fa;
  }

  .discount-card:last-child {
    border-bottom: none;
  }

  .card-header {
    display: flex;
    align-items: center;
    margin-bottom: 12px;
  }

  .discount-badge {
    background: #ff7675;
    color: white;
    padding: 4px 10px;
    border-radius: 20px;
    font-weight: 700;
    font-size: 0.8rem;
    margin-right: 12px;
  }

  .discount-info h4 {
    margin: 0;
    font-size: 1rem;
    color: #2d3436;
  }

  .discount-info p {
    margin: 4px 0 0;
    font-size: 0.85rem;
    color: #636e72;
  }

  .card-footer {
    margin-top: 12px;
  }

  .progress-container {
    height: 6px;
    background: #f1f2f6;
    border-radius: 3px;
    margin-bottom: 8px;
    overflow: hidden;
  }

  .progress-bar {
    height: 100%;
    background: #00b894;
  }

  .meta-info {
    display: flex;
    justify-content: space-between;
    font-size: 0.8rem;
    color: #636e72;
  }

  .apply-btn {
    display: block;
    width: 100%;
    padding: 10px;
    margin-top: 12px;
    background: #00b894;
    color: white;
    border: none;
    border-radius: 6px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s ease;
  }

  .apply-btn:hover {
    background: #00a884;
  }

  .manual-input {
    margin: 20px 0;
  }

  .input-group {
    display: flex;
    border: 1px solid #dfe6e9;
    border-radius: 8px;
    overflow: hidden;
  }

  .input-group input {
    flex-grow: 1;
    padding: 12px 16px;
    border: none;
    outline: none;
    font-size: 0.95rem;
  }

  .input-group button {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0 16px;
    background: #0984e3;
    color: white;
    border: none;
    cursor: pointer;
    transition: background 0.2s ease;
  }

  .input-group button:hover {
    background: #0779cf;
  }

  .input-group button svg {
    margin-left: 6px;
  }

  .active-discount {
    display: flex;
    align-items: center;
    padding: 12px 16px;
    background: #f5f6fa;
    border-radius: 8px;
  }

  .active-discount .label {
    font-weight: 500;
    margin-right: 8px;
    color: #2d3436;
  }

  .active-discount .value {
    font-weight: 600;
    color: #00b894;
  }
  .premium-discount {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
    max-width: 480px;
    margin: 0 auto;
    padding: 28px;
    background: linear-gradient(135deg, #ffffff 0%, #f9fafc 100%);
    border-radius: 16px;
    box-shadow:
            0 4px 6px rgba(0, 0, 0, 0.02),
            0 10px 15px rgba(0, 0, 0, 0.03),
            0 30px 45px rgba(0, 0, 0, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.4);
    backdrop-filter: blur(8px);
    position: relative;
    overflow: hidden;
  }

  .premium-discount::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle, rgba(0,180,216,0.08) 0%, rgba(255,255,255,0) 70%);
    z-index: -1;
  }

  .discount-header {
    display: flex;
    align-items: center;
    margin-bottom: 24px;
  }

  .discount-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 48px;
    height: 48px;
    background: linear-gradient(135deg, #00b4d8 0%, #0077b6 100%);
    border-radius: 12px;
    margin-right: 16px;
    color: white;
  }

  .header-text {
    flex: 1;
  }

  .discount-title {
    font-size: 1.5rem;
    font-weight: 700;
    color: #1a1a1a;
    margin: 0;
    line-height: 1.3;
  }

  .discount-subtitle {
    font-size: 0.9rem;
    color: #6b7280;
    margin: 4px 0 0;
    font-weight: 400;
  }

  .discount-selector {
    position: relative;
    margin-bottom: 20px;
  }

  .selector-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px 20px;
    background: rgba(255, 255, 255, 0.8);
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  }

  .selector-header:hover {
    background: rgba(249, 250, 251, 0.8);
    border-color: #d1d5db;
  }

  .selector-content {
    display: flex;
    align-items: center;
  }

  .selector-icon {
    margin-right: 12px;
    font-size: 1.2rem;
  }

  .selector-text {
    font-weight: 500;
    color: #111827;
    font-size: 0.95rem;
  }

  .selector-arrow {
    transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  }

  .discount-dropdown {
    display: none;
    position: absolute;
    width: 100%;
    max-height: 320px;
    overflow-y: auto;
    background: white;
    border-radius: 12px;
    box-shadow:
            0 10px 15px -3px rgba(0, 0, 0, 0.1),
            0 4px 6px -2px rgba(0, 0, 0, 0.05);
    z-index: 20;
    margin-top: 8px;
    border: 1px solid #f3f4f6;
    transform-origin: top;
    animation: fadeIn 0.2s ease-out forwards;
  }

  @keyframes fadeIn {
    from {
      opacity: 0;
      transform: translateY(-10px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  .discount-card {
    padding: 18px;
    border-bottom: 1px solid #f3f4f6;
    cursor: pointer;
    transition: all 0.2s ease;
  }

  .discount-card:hover {
    background: #f9fafb;
  }

  .discount-card:last-child {
    border-bottom: none;
  }

  .card-header {
    display: flex;
    align-items: center;
    margin-bottom: 14px;
  }

  .discount-tag {
    position: relative;
    margin-right: 16px;
  }

  .discount-badge {
    display: block;
    padding: 6px 12px;
    background: linear-gradient(135deg, #f97316 0%, #ef4444 100%);
    color: white;
    border-radius: 8px;
    font-weight: 700;
    font-size: 0.85rem;
    position: relative;
    z-index: 2;
    box-shadow: 0 2px 4px rgba(239, 68, 68, 0.2);
  }

  .tag-decoration {
    position: absolute;
    top: 2px;
    left: 2px;
    right: 2px;
    bottom: 2px;
    background: linear-gradient(135deg, #f97316 0%, #ef4444 100%);
    filter: blur(4px);
    opacity: 0.6;
    border-radius: 6px;
    z-index: 1;
  }

  .discount-info h4 {
    margin: 0;
    font-size: 1rem;
    color: #111827;
    font-weight: 600;
  }

  .discount-info p {
    margin: 4px 0 0;
    font-size: 0.85rem;
    color: #6b7280;
  }

  .card-footer {
    margin-top: 16px;
  }

  .progress-container {
    height: 6px;
    background: #e5e7eb;
    border-radius: 3px;
    margin-bottom: 10px;
    overflow: hidden;
    position: relative;
  }

  .progress-bar {
    height: 100%;
    background: linear-gradient(90deg, #10b981 0%, #34d399 100%);
    border-radius: 3px;
    position: relative;
    overflow: hidden;
  }

  .progress-shine {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(90deg, rgba(255,255,255,0) 0%, rgba(255,255,255,0.4) 50%, rgba(255,255,255,0) 100%);
    animation: shine 2s infinite;
  }

  @keyframes shine {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
  }

  .meta-info {
    display: flex;
    justify-content: space-between;
    font-size: 0.8rem;
    color: #6b7280;
  }

  .meta-info i {
    margin-right: 4px;
    vertical-align: middle;
  }

  .icon-circle {
    display: inline-block;
    width: 6px;
    height: 6px;
    background: #10b981;
    border-radius: 50%;
  }

  .icon-clock {
    display: inline-block;
    width: 0.8rem;
    height: 0.8rem;
    background: currentColor;
    mask: url("data:image/svg+xml,%3Csvg viewBox='0 0 24 24' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M12 8V12L15 15M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12Z' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E");
    mask-repeat: no-repeat;
    mask-position: center;
  }

  .apply-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    padding: 12px;
    margin-top: 16px;
    background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
    color: white;
    border: none;
    border-radius: 8px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;
    box-shadow: 0 2px 4px rgba(59, 130, 246, 0.2);
  }

  .apply-btn:hover {
    background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
    transform: translateY(-1px);
    box-shadow: 0 4px 6px rgba(59, 130, 246, 0.3);
  }

  .apply-btn:active {
    transform: translateY(0);
  }

  .apply-btn svg {
    margin-left: 8px;
    transition: transform 0.2s ease;
  }

  .apply-btn:hover svg {
    transform: translateX(2px);
  }

  .manual-input {
    margin: 24px 0;
  }

  .input-container {
    position: relative;
    display: flex;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  }

  .input-decoration {
    position: absolute;
    left: 16px;
    top: 50%;
    transform: translateY(-50%);
    color: #9ca3af;
    pointer-events: none;
  }

  .input-container input {
    flex-grow: 1;
    padding: 16px 16px 16px 48px;
    border: 1px solid #e5e7eb;
    border-right: none;
    outline: none;
    font-size: 0.95rem;
    border-radius: 12px 0 0 12px;
    transition: all 0.2s ease;
    background: rgba(255, 255, 255, 0.8);
  }

  .input-container input:focus {
    border-color: #3b82f6;
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
  }

  .input-container .apply-btn {
    width: auto;
    margin: 0;
    padding: 0 20px;
    border-radius: 0 12px 12px 0;
    box-shadow: none;
  }

  .active-discount {
    display: flex;
    align-items: center;
    padding: 16px;
    background: rgba(239, 246, 255, 0.6);
    border-radius: 12px;
    border: 1px solid #dbeafe;
  }

  .active-badge {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    background: linear-gradient(135deg, #10b981 0%, #34d399 100%);
    border-radius: 8px;
    margin-right: 12px;
    color: white;
    flex-shrink: 0;
  }

  .active-content {
    flex: 1;
  }

  .active-discount .label {
    font-weight: 500;
    font-size: 0.9rem;
    color: #4b5563;
    display: block;
    margin-bottom: 2px;
  }

  .active-discount .value {
    font-weight: 600;
    font-size: 1.05rem;
    color: #1e40af;
    display: block;
  }

  /* Animation when dropdown opens */
  .selector-header.active .selector-arrow {
    transform: rotate(180deg);
  }

  /* Responsive adjustments */
  @media (max-width: 480px) {
    .premium-discount {
      padding: 20px;
      border-radius: 12px;
    }

    .discount-header {
      flex-direction: column;
      align-items: flex-start;
    }

    .discount-icon {
      margin-bottom: 12px;
    }
  }
  .discount-modern-container {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
    max-width: 100%;
    margin: 0 auto;
  }

  .discount-modern-card {
    background: white;
    border-radius: 16px;
    box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
    padding: 24px;
    transition: all 0.3s ease;
  }

  .discount-header-modern {
    display: flex;
    align-items: center;
    margin-bottom: 24px;
  }

  .discount-icon-modern {
    background: #EEF2FF;
    width: 48px;
    height: 48px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 16px;
  }

  .discount-icon-modern svg {
    color: #4F46E5;
  }

  .header-text-modern h3 {
    font-size: 18px;
    font-weight: 600;
    color: #111827;
    margin: 0 0 4px 0;
  }

  .header-text-modern p {
    font-size: 14px;
    color: #6B7280;
    margin: 0;
  }

  .discount-selector-modern {
    position: relative;
    margin-bottom: 16px;
  }

  .selector-header-modern {
    background: #F9FAFB;
    border: 1px solid #E5E7EB;
    border-radius: 12px;
    padding: 14px 16px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    cursor: pointer;
    transition: all 0.2s ease;
  }

  .selector-header-modern:hover {
    border-color: #D1D5DB;
  }

  .selector-content-modern {
    display: flex;
    align-items: center;
  }

  .selector-icon-modern {
    font-size: 20px;
    margin-right: 12px;
  }

  .selector-text-modern {
    font-size: 15px;
    font-weight: 500;
    color: #111827;
  }

  .selector-arrow-modern svg {
    color: #6B7280;
    transition: transform 0.2s ease;
  }

  .discount-dropdown-modern {
    display: none;
    position: absolute;
    width: 100%;
    background: white;
    border: 1px solid #E5E7EB;
    border-radius: 12px;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    margin-top: 8px;
    z-index: 10;
    overflow: hidden;
  }

  .discount-card-modern {
    padding: 16px;
    border-bottom: 1px solid #F3F4F6;
    transition: background 0.2s ease;
  }

  .discount-card-modern:last-child {
    border-bottom: none;
  }

  .discount-card-modern:hover {
    background: #F9FAFB;
  }

  .card-header-modern {
    display: flex;
    align-items: flex-start;
    margin-bottom: 12px;
  }

  .discount-tag-modern {
    position: relative;
    margin-right: 16px;
  }

  .discount-badge-modern {
    background: #4F46E5;
    color: white;
    font-weight: 600;
    font-size: 14px;
    padding: 4px 10px;
    border-radius: 6px;
    display: inline-block;
  }

  .discount-info-modern h4 {
    font-size: 15px;
    font-weight: 600;
    color: #111827;
    margin: 0 0 4px 0;
  }

  .discount-info-modern p {
    font-size: 13px;
    color: #6B7280;
    margin: 0;
  }

  .card-footer-modern {
    margin-top: 12px;
  }

  .progress-container-modern {
    margin-bottom: 8px;
  }

  .progress-bar-modern {
    height: 6px;
    background: #E5E7EB;
    border-radius: 3px;
    overflow: hidden;
  }

  .progress-fill-modern {
    height: 100%;
    background: linear-gradient(90deg, #8B5CF6, #4F46E5);
    border-radius: 3px;
    position: relative;
  }

  .progress-meta-modern {
    display: flex;
    justify-content: space-between;
    font-size: 12px;
    color: #6B7280;
  }

  .apply-btn-modern {
    width: 100%;
    background: linear-gradient(90deg, #8B5CF6, #4F46E5);
    color: white;
    border: none;
    border-radius: 8px;
    padding: 10px;
    font-weight: 600;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 12px;
    cursor: pointer;
    transition: all 0.2s ease;
  }

  .apply-btn-modern:hover {
    opacity: 0.9;
    transform: translateY(-1px);
  }

  .apply-btn-modern svg {
    margin-left: 8px;
  }

  .manual-input-modern {
    margin-top: 16px;
  }

  .input-container-modern {
    display: flex;
    align-items: center;
    background: #F9FAFB;
    border: 1px solid #E5E7EB;
    border-radius: 12px;
    padding: 8px 16px;
    transition: all 0.2s ease;
  }

  .input-container-modern:focus-within {
    border-color: #4F46E5;
    box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
  }

  .input-container-modern svg {
    color: #6B7280;
    margin-right: 12px;
  }

  #discount-input-modern {
    flex: 1;
    border: none;
    background: transparent;
    padding: 8px 0;
    font-size: 15px;
    color: #111827;
    outline: none;
  }

  .apply-input-btn-modern {
    background: #4F46E5;
    color: white;
    border: none;
    border-radius: 8px;
    padding: 8px 16px;
    font-weight: 500;
    font-size: 14px;
    cursor: pointer;
    transition: all 0.2s ease;
  }

  .apply-input-btn-modern:hover {
    background: #4338CA;
  }

  .active-discount-modern {
    display: flex;
    align-items: center;
    background: #ECFDF5;
    border-radius: 12px;
    padding: 12px 16px;
    margin-top: 16px;
  }

  .active-badge-modern {
    background: #D1FAE5;
    width: 32px;
    height: 32px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 12px;
  }

  .active-badge-modern svg {
    color: #10B981;
  }

  .active-content-modern {
    flex: 1;
  }

  .label-modern {
    font-size: 13px;
    color: #6B7280;
    display: block;
    margin-bottom: 2px;
  }

  .value-modern {
    font-size: 15px;
    font-weight: 500;
    color: #111827;
  }

  /* Animation for dropdown */
  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
  }

  .discount-dropdown-modern.show {
    display: block;
    animation: fadeIn 0.2s ease-out;
  }

  .selector-arrow-modern.rotate svg {
    transform: rotate(180deg);
  }
</style>

<body>
<%@include file="header.jsp"%>
<section style="margin-bottom: 400px">
  <header class="progress-header">
    <div class="step-container">
      <!-- Step 1 -->
      <div class="step">
        <div class="step-icon">1</div>
        <div class="step-text">GIỎ HÀNG</div>
      </div>
      <!-- Line -->
      <div class="step-line"></div>
      <!-- Step 2 -->
      <div class="step active">
        <div class="step-icon">2</div>
        <div class="step-text">THANH TOÁN</div>
      </div>
      <!-- Line -->
      <div class="step-line"></div>
      <!-- Step 3 -->
      <div class="step">
        <div class="step-icon">3</div>
        <div class="step-text">HOÀN TẤT</div>
      </div>
    </div>
  </header>
  <section class="content" style="height: 1100px">
    <article class="khuyenmai">
      <p class="pkhuyenmai">
        Bạn có ưu đãi? <b onclick="toggleBox()">Ấn vào đây để nhập mã</b>
      </p>
      <article class="inputkhuyenmai" id = "newBox">
        <article class="textinput">
          Nếu bạn có mã giảm giá, vui lòng điền vào bên dưới.

        </article>
        <form action="" class="form">
          <textarea name="" id="" class="inputvaluekhuyenmai" placeholder="Nhập mã vào đây"></textarea>
          <button type="submit" class="button"> Xác nhận
          </button>
        </form>
      </article>
      <section class="contentproduct">
        <article class="inforkhuyenmai">
          <article class="icon">
            <i class="fa-solid fa-circle-exclamation"></i>
          </article>
          <article class="inforchitiet">
            <p>Để nhận
              "35 NAXA"
              Quý khách hãy
              <a href="http://">Đăng nhập</a>
              vào tài khoản. Nếu chưa có, Quý khách hãy tick
              <a href="http://">Tạo tài khoản mới?</a>
              nhé!</p>
          </article>
        </article>
        <form action="CheckoutServlet" method="post">
          <section class="information">

            <article class="inforfreeship">
              <p class="p">Thêm <span style="color: rgb(157, 56, 27); font-size: 15px;"> 455.000₫</span> nữa bạn sẽ được FREESHIP</p>
              <article class="rowfreeship">
                <article class="rowcheck">
                </article>
              </article>
            </article>
            <!--Thong tin ca  nhan de thanh toan-->
            <div class=" py-8" style="margin-left: -20px" >
              <div class="row">
                <!-- Thông Tin Thanh Toán -->
                <div class="col-md-5">
                  <div class="card payment-info-card">
                    <div class="payment-info-header text-center" style="background-color: #ff7b00">
                      Thông Tin Thanh Toán
                    </div>
                    <div class="card-body">
                      <div class="mb-3">
                        <label for="fullName" class="form-label">Họ và Tên *</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Nhập họ và tên">
                      </div>
                      <div class="mb-3">
                        <label for="phoneNumber" class="form-label">Số Điện Thoại *</label>
                        <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Nhập số điện thoại">
                      </div>
                      <div class="mb-3">
                        <label for="email" class="form-label">Địa chỉ Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email (tùy chọn)">
                      </div>
                      <div class="row">
                        <!-- Chọn tỉnh/thành phố -->
                        <div class="col-md-6 mb-3">
                          <label for="province" class="form-label">Tỉnh/Thành Phố *</label>
                          <select class="form-select" id="province" name="province">
                            <option value="">Chọn một tùy chọn...</option>
                          </select>
                        </div>

                        <!-- Chọn quận/huyện -->
                        <div class="col-md-6 mb-3">
                          <label for="district" class="form-label">Quận/Huyện *</label>
                          <select class="form-select" id="district" name="district">
                            <option value="">Chọn quận/huyện...</option>
                          </select>
                        </div>

                        <!-- Chọn phường/xã -->
                        <div class="col-md-6 mb-3">
                          <label for="ward" class="form-label">Phường/Xã *</label>
                          <select class="form-select" id="ward" name="ward">
                            <option value="">Chọn phường/xã...</option>
                          </select>
                        </div>
                      </div>

                      <!-- Ẩn các input để gửi giá trị tên (text) -->
                      <input type="hidden" id="province_name" name="province_name" value="">
                      <input type="hidden" id="district_name" name="district_name" value="">
                      <input type="hidden" id="ward_name" name="ward_name" value="">


                      <div class="mb-3">
                        <label for="address" class="form-label">Địa chỉ *</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="Tòa nhà, số nhà, tên đường">
                      </div>
                      <div class="form-check mb-3">
                        <input type="checkbox" class="form-check-input" id="differentAddress" name="differentAddress">
                        <label class="form-check-label" for="differentAddress">Giao hàng tới địa chỉ khác?</label>
                      </div>
                      <div class="mb-3">
                        <label for="notes" class="form-label">Ghi Chú Đơn Hàng</label>
                        <textarea class="form-control" id="notes" name="notes" rows="3" placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay địa điểm giao hàng"></textarea>
                      </div>
                      <p>Địa chỉ cửa hàng mua: Tp.Cần thơ</p>
                    </div>

                  </div>
                  <div id="cod-info" class="payment-inf">
                    <form id="shippingForm">
                    <h4 ><i class="fa-solid fa-truck"></i> <span>Chọn phương thức giao hàng</span></h4>
                    <div class="card-body p-4" id="shipping-options">

                      <c:forEach var="item" items="${sessionScope.totalship.items}">
                        <label class="shipping-option">
                          <input type="radio"
                                 name="shippingMethod"
                                 value="${item.id}"
                                 data-price="${item.price}"
                                 id="shipping_${item.id}"
                                 onchange="updateShippingCost(this)"
                                 required>

                          <div class="shipping-content">
                            <span class="shipping-title">${item.name}</span>
                            <span class="shipping-price">
                <strong>
                    <fmt:formatNumber value="${item.price}" type="number" groupingUsed="true" /> đ
                </strong>
            </span>
                          </div>
                        </label>
                        <input type="hidden" id="shippingPrice" name="shippingPrice" value="0">

                      </c:forEach>
                    </div>

                    <!-- Ô nhập mã giảm giá vận chuyển -->
                    <div class="shipping-discount">
                      <input type="text" id="shippingCoupon" placeholder="Nhập mã giảm giá vận chuyển">
                      <button id="applyShippingCoupon">Áp dụng</button>
                    </div>
                    </form>
                  </div>

                </div>

                <!-- Thông Tin Đơn Hàng -->
                <div class="col-md-5" style="width: 700px">
                  <div class="card order-summary-card">
                    <div class="order-summary-header text-center" style="background-color: #ff7b00;">
                      Thông Tin Đơn Hàng
                    </div>
                    <div class="card-body" style="overflow: scroll ;height: 500px;">
                      <!-- Sản phẩm -->
                      <%
                        Cart cart = (Cart) session.getAttribute("cr7");
                        if (cart == null) {
                          cart = new Cart();
                          session.setAttribute("cr7", cart);
                        }
                        System.out.println("Session Cart: " + cart);
                        System.out.println("Number of items in cart: " + cart.getItems().size());
                        Shipping shipping = (Shipping) session.getAttribute("totalship");
                        if(shipping == null){
                          shipping = new Shipping();
                          session.setAttribute("totalship",shipping);
                        }
                        System.out.println(shipping.getItems() + "adsfasdfsdf");


                      %>
                      <c:forEach var="item" items="${sessionScope.cr7.items}">
                        <div class="cart-item" style="height: 100px">
                          <img src="img/${item.img}" alt="Sản phẩm">
                          <div class="cart-info">
                            <h5>${item.name}</h5>
                            <p><span style="color: rgb(83, 7, 7);">ID:</span> ${item.id} | <span style="color: rgb(83, 7, 7);">Trọng lượng:</span>${item.weight}gr</p>

                            <!-- Hiển thị giá -->
                            <div class="price-container" style="color: rgb(240, 89, 89); ;"><b>Giá:</b>
                              <span class="original-price">${item.rawTotal} đ</span>
                              <span class="discount-badge">-${item.sale}%</span>
                              <span class="discount-price"><fmt:formatNumber value="${item.total}" type="number" groupingUsed="true" /> đ</span>
                            </div>
                          </div>

                          <!-- Input số lượng -->
                          <td class="text-center">
                            <div class="quantity-control">

                              <input type="text" id="quantity-${item.id}" class="form-control form-control-sm text-center mx-1" value="${item.quantity}" style="width: 50px;" readonly data-price="${item.price}">

                            </div>
                          </td>

                          <!-- Nút xóa -->
                          <td><a href="remove?productID=${item.id}&weight=${item.weight}"><button class="remove-btn ms-3"><i class="fas fa-trash-alt"></i></button></a></td>
                        </div>
                      </c:forEach>
                      <!-- Tổng cộng -->
                  </div>
                </div>
                  <c:set var="sum" value="${sessionScope.cr7.totalPrice}" />
                  <c:set var="saveMoney" value="${sessionScope.cr7.saveMoney}" />
                  <c:set var="totalPrice" value="${sessionScope.cr7.rawTotalPrice}" />

                  <div class="cart-summary">
                    <h5 class="mb-3 box">📦 Cộng giỏ hàng</h5>
                    <ul class="list-unstyled">
                      <li class="d-flex justify-content-between">
                        <span>Tạm tính:</span>
                        <strong id="cart-total"><fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" /> đ</strong>
                      </li>
                      <li>
                        <span>Phí vận chuyển:</span>
                        <strong id="shipping-fee">40.000 đ</strong>
                      </li>

                      <div class="discount-modern-container">
                        <div class="discount-modern-card">
                          <!-- Header Section -->
                          <div class="discount-header-modern">
                            <div class="discount-icon-modern">
                              <svg width="28" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12Z" stroke="#4F46E5" stroke-width="1.5"/>
                                <path d="M9 15L15 9" stroke="#4F46E5" stroke-width="1.5" stroke-linecap="round"/>
                                <path d="M14.5 14.5L15 15" stroke="#4F46E5" stroke-width="1.5" stroke-linecap="round"/>
                                <path d="M9 9L9.5 9.5" stroke="#4F46E5" stroke-width="1.5" stroke-linecap="round"/>
                                <path d="M14.5 9.5L15.5 10.5" stroke="#4F46E5" stroke-width="1.5" stroke-linecap="round"/>
                                <path d="M9.5 14.5L10.5 15.5" stroke="#4F46E5" stroke-width="1.5" stroke-linecap="round"/>
                              </svg>
                            </div>
                            <div class="header-text-modern">
                              <h3 class="discount-title-modern">Ưu đãi đặc biệt</h3>
                              <p class="discount-subtitle-modern">Chọn mã giảm giá hoặc nhập mã của bạn</p>
                            </div>
                          </div>

                          <!-- Discount Selector -->
                          <div class="discount-selector-modern">
                            <div class="selector-header-modern" onclick="toggleDiscountList()">
                              <div class="selector-content-modern">
                                <span class="selector-icon-modern">🎁</span>
                                <span class="selector-text-modern">Chọn mã giảm giá</span>
                              </div>
                              <span class="selector-arrow-modern">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                  <path d="M6 9L12 15L18 9" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                              </span>
                            </div>

                            <div class="discount-dropdown-modern" id="discount-list">
                              <div class="discount-card-modern" onclick="applyDiscount('SALE50', 50000)">
                                <div class="card-header-modern">
                                  <div class="discount-tag-modern">
                                    <span class="discount-badge-modern">-50K</span>
                                  </div>
                                  <div class="discount-info-modern">
                                    <h4>Giảm 50.000đ</h4>
                                    <p>Áp dụng cho mọi đơn hàng</p>
                                  </div>
                                </div>
                                <div class="card-footer-modern">
                                  <div class="progress-container-modern">
                                    <div class="progress-bar-modern">
                                      <div class="progress-fill-modern" style="width: 100%"></div>
                                    </div>
                                    <div class="progress-meta-modern">
                                      <span class="stock-modern">Còn 100%</span>
                                      <span class="time-modern">Hết hạn sau: 18 phút</span>
                                    </div>
                                  </div>
                                </div>
                                <button class="apply-btn-modern" onclick="copyCode('SALE50')">
                                  <span>Áp dụng ngay</span>
                                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M5 12H19M12 5L19 12L12 19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                  </svg>
                                </button>
                              </div>
                              <div class="discount-card-modern" onclick="applyDiscount('SALE100', 100000)">
                                <div class="card-header-modern">
                                  <div class="discount-tag-modern">
                                    <span class="discount-badge-modern">-100K</span>
                                  </div>
                                  <div class="discount-info-modern">
                                    <h4>Giảm 100.000đ</h4>
                                    <p>Áp dụng cho mọi đơn hàng</p>
                                  </div>
                                </div>
                                <div class="card-footer-modern">
                                  <div class="progress-container-modern">
                                    <div class="progress-bar-modern">
                                      <div class="progress-fill-modern" style="width: 100%"></div>
                                    </div>
                                    <div class="progress-meta-modern">
                                      <span class="stock-modern">Còn 100%</span>
                                      <span class="time-modern">Hết hạn sau: 18 phút</span>
                                    </div>
                                  </div>
                                </div>
                                <button class="apply-btn-modern" onclick="copyCode('SALE100')">
                                  <span>Áp dụng ngay</span>
                                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M5 12H19M12 5L19 12L12 19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                  </svg>
                                </button>
                              </div>
                            </div>

                          </div>

                          <!-- Manual Input -->
                          <div class="manual-input-modern">
                            <div class="input-container-modern">
                              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M15 15L21 21M10 17C6.13401 17 3 13.866 3 10C3 6.13401 6.13401 3 10 3C13.866 3 17 6.13401 17 10C17 13.866 13.866 17 10 17Z" stroke="#6B7280" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                              </svg>
                              <input type="text" id="discount-input-modern" placeholder="Nhập mã giảm giá...">
                              <button class="apply-input-btn-modern" onclick="applyManualDiscount()">
                                <span>Kiểm tra</span>
                              </button>
                            </div>
                          </div>

                          <!-- Active Discount -->
                          <div class="active-discount-modern">
                            <div class="active-badge-modern">
                              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M9 12L11 14L15 10M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12Z" stroke="#10B981" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                              </svg>
                            </div>
                            <div class="active-content-modern">
                              <span class="label-modern">Mã đang áp dụng:</span>
                              <span id="selected-discount-modern" class="value-modern">Chưa chọn</span>
                            </div>
                          </div>
                        </div>
                      </div>


                      <li class="coupon">
                        <span>Mã giảm giá:</span>
                        <strong id="coupon-discount">-100.000 đ</strong>
                      </li>
                      <li class="d-flex justify-content-between mt-2">
                        <span class="fw-bold text-warning">Tiết kiệm:</span>
                        <span id="discount-amount" class="text-danger" data-initial="${saveMoney}">
                          -<fmt:formatNumber value="${saveMoney}" type="number" groupingUsed="true" /> đ</span>

                      </li>

                      <li class="total-price d-flex justify-content-between mt-2">
                        <span class="fw-bold">Tổng cộng:</span>

                        <span id="final-total" class="text-danger fw-bold" data-initial="${sum}"><fmt:formatNumber value="${sum}" type="number" groupingUsed="true" /> đ</span>
                      </li>

                    </ul>
                    <button class="checkout-btn">
                      <i class="fas fa-credit-card"></i> Xác nhận thanh toán
                    </button>
                  </div>
              </div>
            </div>
            </div>

          </section>
        </form>
      </section>
    </article>
  </section>
</section>
<div style=" background-color: #f3eee7;  height: 450px">
  <%@include file="footer.jsp"%>
</div>
<script>
  // Hàm tải tỉnh/thành phố từ API
  // Hàm tải tỉnh/thành phố từ API
  async function loadProvinces() {
    const response = await fetch('https://esgoo.net/api-tinhthanh/1/0.htm');
    const data = await response.json();
    const provinceSelect = document.getElementById('province');

    if (data.error === 0) {
      data.data.forEach(province => {
        let option = new Option(province.full_name, province.id);
        provinceSelect.add(option);
      });
    }
  }

  // Hàm tải quận/huyện theo tỉnh/thành phố
  async function loadDistricts(provinceID) {
    const districtSelect = document.getElementById('district');
    const wardSelect = document.getElementById('ward');

    // Reset quận/huyện và phường/xã
    districtSelect.innerHTML = '<option value="">Chọn quận/huyện...</option>';
    wardSelect.innerHTML = '<option value="">Chọn phường/xã...</option>';

    if (!provinceID) return;

    try {
      const url = 'https://esgoo.net/api-tinhthanh/2/' + provinceID + '.htm';
      const response = await fetch(url);
      const data = await response.json();

      if (data.error === 0 && data.data) {
        data.data.forEach(district => {
          let option = new Option(district.full_name, district.id);
          districtSelect.add(option);
        });
      }
    } catch (error) {
      console.error("Lỗi tải quận/huyện:", error);
    }
  }

  // Hàm tải phường/xã theo quận/huyện
  async function loadWards(districtID) {
    const wardSelect = document.getElementById('ward');
    wardSelect.innerHTML = '<option value="">Chọn phường/xã...</option>';

    if (!districtID) return;

    const url = 'https://esgoo.net/api-tinhthanh/3/' + districtID + '.htm';
    const response = await fetch(url);
    const data = await response.json();

    if (data.error === 0) {
      data.data.forEach(ward => {
        let option = new Option(ward.full_name, ward.id);
        wardSelect.add(option);
      });
    }
  }

  // Khi trang tải, tải tỉnh/thành phố
  loadProvinces();

  // Khi chọn tỉnh/thành phố
  document.getElementById('province').addEventListener('change', function () {
    const provinceID = this.value;
    const provinceName = this.options[this.selectedIndex].text; // Lấy tên tỉnh/thành phố
    document.getElementById('province_name').value = provinceName; // Cập nhật giá trị vào input ẩn
    loadDistricts(provinceID);
  });

  // Khi chọn quận/huyện
  document.getElementById('district').addEventListener('change', function () {
    const districtID = this.value;
    const districtName = this.options[this.selectedIndex].text; // Lấy tên quận/huyện
    document.getElementById('district_name').value = districtName; // Cập nhật giá trị vào input ẩn
    loadWards(districtID);
  });

  // Khi chọn phường/xã
  document.getElementById('ward').addEventListener('change', function () {
    const wardID = this.value;
    const wardName = this.options[this.selectedIndex].text; // Lấy tên phường/xã
    document.getElementById('ward_name').value = wardName; // Cập nhật giá trị vào input ẩn
  });

</script>


<script>


  function handlePaymentSelection(selectedRadio) {
    // Lấy tất cả các phần tử collapse
    const paymentCollapses = document.querySelectorAll('.accordion-collapse');

    // Ẩn tất cả các phần collapse
    paymentCollapses.forEach((collapse) => {
      collapse.classList.remove('show');
    });

    // Hiển thị phần tương ứng với radio được chọn
    const selectedId = selectedRadio.id;
    const collapseId = selectedId + 'Collapse'; // Tạo id của phần collapse tương ứng
    const targetCollapse = document.getElementById(collapseId);

    if (targetCollapse) {
      targetCollapse.classList.add('show');
    }

    selectedRadio.form.submit();


  }
  fetch('https://esgoo.net/api-tinhthanh/1/0.htm')
          .then(response => response.json())
          .then(data => console.log(data));



  let productTotal = parseFloat(<%= cart.getTotalPrice() %>); // Tổng tiền sản phẩm

  function updateShippingCost(radio) {
    // Lấy phí giao hàng từ giá trị radio button
    let shippingCost = parseFloat(radio.getAttribute("data-price")) || 0;

    // Cập nhật giá trị của trường ẩn
    document.getElementById("shippingPrice").value = shippingCost;

    // Tính tổng tiền
    let total = productTotal + shippingCost;

    // Hiển thị tổng tiền
    document.getElementById("totalAmount").textContent = new Intl.NumberFormat("vi-VN", {
      style: "currency",
      currency: "VND",
    }).format(total);
  }



</script>
<script>
  function toggleDiscountList() {
    const dropdown = document.querySelector('.discount-dropdown-modern');
    const arrow = document.querySelector('.selector-arrow-modern');

    dropdown.classList.toggle('show');
    arrow.classList.toggle('rotate');
  }

  function applyDiscount(code, amount) {
    // Cập nhật thông tin mã giảm giá đã chọn
    document.getElementById('selected-discount-modern').textContent = code + ' (-' + amount.toLocaleString() + 'đ)';
    document.getElementById('selected-discount-modern').style.color = '#10B981';
    document.getElementById('coupon-discount').innerHTML = ' -' + amount.toLocaleString() + 'đ';

    // Cập nhật tổng số tiền tiết kiệm
    var discountEl = document.getElementById('discount-amount');
    var initialDiscount = parseInt(discountEl.dataset.initial) || 0;
    var totalDiscount = initialDiscount + amount;
    discountEl.textContent = '-' + totalDiscount.toLocaleString('vi-VN') + ' đ';

    // Tính lại tổng cộng sau khi trừ giảm giá
    var totalEl = document.getElementById('final-total');
    var initialTotal = parseInt(totalEl.dataset.initial) || 0;
    var newTotal = initialTotal - amount;

    // Cập nhật hiển thị tổng cộng
    totalEl.textContent = newTotal.toLocaleString('vi-VN') + ' đ';

    // Đóng dropdown
    document.querySelector('.discount-dropdown-modern').classList.remove('show');
    document.querySelector('.selector-arrow-modern').classList.remove('rotate');
  }



  function copyCode(code) {
    // Prevent event bubbling to avoid triggering applyDiscount
    event.stopPropagation();
    navigator.clipboard.writeText(code);
    alert('Đã sao chép mã ' + code);
  }

  function applyManualDiscount() {
    const input = document.getElementById('discount-input-modern');
    if (input.value.trim() !== '') {
      document.getElementById('selected-discount-modern').textContent = input.value;
      document.getElementById('selected-discount-modern').style.color = '#10B981';
      input.value = '';
    }
  }
</script>
<script>
  $(document).ready(function () {
    $.ajax({
      url: '${pageContext.request.contextPath}/discounts',
      method: 'GET',
      dataType: 'json',
      success: function (data) {
        // Xử lý thành công và hiển thị các mã giảm giá
        var container = $('#discount-list');
        console.log(data)
        data.forEach(function (discount) {
          console.log(discount.discountAmount + "hkjahsdkhakjsd")
          var discountHtml = '<div class="discount-card-modern" onclick="applyDiscount(\'' + discount.discountCode + '\', ' + discount.discountAmount + ')">' +
                  '<div class="card-header-modern">' +
                  '<div class="discount-tag-modern">' +
                  '<span class="discount-badge-modern">-' + discount.discountAmount + 'đ</span>' +
                  '</div>' +
                  '<div class="discount-info-modern">' +
                  '<h4>Giảm ' + discount.discountAmount + 'đ</h4>' +
                  '<p>Áp dụng cho đơn từ ' + discount.minOrderAmount + 'đ</p>' +
                  '</div>' +
                  '</div>' +
                  '<div class="card-footer-modern">' +
                  '<div class="progress-container-modern">' +
                  '<div class="progress-bar-modern">' +
                  '<div class="progress-fill-modern" style="width: 100%"></div>' +
                  '</div>' +
                  '<div class="progress-meta-modern">' +
                  '<span class="stock-modern">Còn 100%</span>' +
                  '<span class="time-modern">Hết hạn sau: 18 phút</span>' +
                  '</div>' +
                  '</div>' +
                  '</div>' +
                  '<button class="apply-btn-modern" onclick="copyCode(\'' + discount.discountCode + '\')">' +
                  '<span>Áp dụng ngay</span>' +
                  '<svg width="18" height="18" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">' +
                  '<path d="M5 12H19M12 5L19 12L12 19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>' +
                  '</svg>' +
                  '</button>' +
                  '</div>';

          console.log(discountHtml)
          container.append(discountHtml);
        });
      },
      error: function (xhr, status, error) {
        console.error('Lỗi khi tải dữ liệu:', error);
      }
    });
  });
</script>
<script>
  function applyManualDiscount() {
    // Lấy giá trị mã giảm giá từ input
    var discountCode = $('#discount-input-modern').val().trim();

    // Kiểm tra xem mã giảm giá có trống không
    if (!discountCode) {
      alert("Vui lòng nhập mã giảm giá!");
      return;
    }

    $.ajax({
      url: '${pageContext.request.contextPath}/discounts',
      method: 'POST',
      data: { discountCode: discountCode },
      success: function (data) {
        // Kiểm tra kết quả trả về từ backend
        if (data.success) {
          // Nếu mã giảm giá hợp lệ, hiển thị giảm giá
          alert("Mã giảm giá hợp lệ! Bạn được giảm " + data.discountAmount + "đ.");
          document.getElementById('coupon-discount').innerHTML = ' -' + data.discountAmount.toLocaleString() + 'đ';


        } else {

          alert("Mã giảm giá không hợp lệ!");
        }
      },
      error: function (xhr, status, error) {
        console.error('Lỗi khi kiểm tra mã giảm giá:', error);
      }
    });
  }
</script>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripthanhtoan.js"></script>
<%--<script src="js/pay.js"></script>--%>
</html>