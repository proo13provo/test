async function refreshToken() {
    try {
        const refreshToken = localStorage.getItem("refreshToken"); // Lấy từ LocalStorage

        if (!refreshToken) return false;

        const response = await fetch("http://localhost:8080/auth/refresh-token", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ refreshToken })
        });

        if (!response.ok) throw new Error("Lỗi khi refresh token");

        const data = await response.json();
        localStorage.setItem("token", data.accessToken); // Lưu token mới
        return true;
    } catch (error) {
        console.error("Lỗi khi refresh token:", error);
        return false;
    }
}
async function fetchWithToken(url, options = {}) {
    console.log("hoangvu")
    let token = localStorage.getItem("token");

    options.headers = {
        ...options.headers,
        "Authorization": `Bearer ${token}`,
        "Content-Type": "application/json"
    };

    let response = await fetch(url, options);
    console.log(response)

    if (response.status === 403) { // Token hết hạn
        console.warn("Token hết hạn, đang thử refresh...");
        const refreshed = await refreshToken();
        console.log(refreshed)

        if (refreshed) {
            token = localStorage.getItem("token");
            options.headers["Authorization"] = `Bearer ${token}`;
            response = await fetch(url, options);
        } else {
            console.error("Refresh token không hợp lệ, yêu cầu đăng nhập lại.");
            return null;
        }
    }

    return response;
}

document.getElementById('paymentSelect').addEventListener('change', function() {
    let paymentContainer = document.querySelector('.payment-container');
    if (this.value) {
        paymentContainer.classList.add('active');
    } else {
        paymentContainer.classList.remove('active');
    }
});
document.addEventListener("DOMContentLoaded", function () {
    const paymentSelect = document.getElementById("paymentSelect");
    const paymentInfos = document.querySelectorAll(".payment-info");

    function showSelectedPaymentInfo(value) {
        paymentInfos.forEach(info => {
            if (info.id === value + "-info") {
                info.style.display = "block"; // Hiện div
                setTimeout(() => {
                    info.classList.add("active"); // Kích hoạt hiệu ứng
                }, 10);
            } else {
                info.classList.remove("active"); // Ẩn hiệu ứng cũ
                setTimeout(() => {
                    info.style.display = "none"; // Ẩn div
                }, 300); // Tránh mất ngay lập tức, tạo hiệu ứng
            }
        });
    }

    paymentSelect.addEventListener("change", function () {
        showSelectedPaymentInfo(this.value);
    });

    // Hiển thị mặc định nếu có sẵn giá trị
    if (paymentSelect.value) {
        showSelectedPaymentInfo(paymentSelect.value);
    }
});
document.addEventListener("DOMContentLoaded", function () {
    let cart = JSON.parse(localStorage.getItem("cart")) || [];
    let cartContainer = document.querySelector(".cart-container");
    let cartTotal = document.getElementById("cart-total");
    let discountAmount = document.getElementById("discount-amount");
    let finalTotal = document.getElementById("final-total");

    function updateCartUI() {
        cartContainer.innerHTML = ""; // Xóa dữ liệu cũ
        let totalPrice = 0;
        let totalDiscount = 0;
        console.log(cart)

        cart.forEach((product, index) => {
            let originalPrice = product.totalOriginalPrice ;
            let discount = originalPrice - product.finalPrice;
            let totalItemPrice = product.totalOriginalPrice * product.quantity;
            totalPrice += totalItemPrice;
            totalDiscount += discount * product.quantity;

            let cartItemHTML = `
                <div class="cart-item">
                    <img src="${product.image}" alt="${product.name}">
                    <div class="cart-info">
                        <h5>${product.name}</h5>
                        <p><span>ID:</span> ${product.id} | <span>Trọng lượng:</span> ${product.variant || "N/A"}</p>
                        
                        <div class="price-container">
                            <span class="original-price">${originalPrice.toLocaleString("vi-VN")} đ</span>
                            <span class="discount-badge">-${((discount / originalPrice) * 100).toFixed(0)}%</span>

                            <span class="discount-price">${Math.round(product.finalPrice).toLocaleString("vi-VN")} đ</span>
                        </div>
                    </div>

                    <input type="number" class="cart-quantity" data-index="${index}" value="${product.quantity}" min="1">
                    
                    <button class="remove-btn" data-index="${index}"><i class="fas fa-trash-alt"></i></button>
                </div>
            `;

            cartContainer.innerHTML += cartItemHTML;
        });

        // Cập nhật tổng giá trị giỏ hàng
        cartTotal.innerText = totalPrice.toLocaleString("vi-VN") + " đ";
        discountAmount.innerText = `- ${Math.round(totalDiscount)} đ`;
        let finalAmount = Math.max(0, totalPrice - totalDiscount); // Đảm bảo không âm
        finalTotal.innerText = finalAmount.toLocaleString("vi-VN") + " đ";

        attachEventListeners(); // Gọi lại để cập nhật sự kiện
    }

    function attachEventListeners() {
        document.querySelectorAll(".cart-quantity").forEach(input => {
            input.addEventListener("change", function () {
                let index = this.dataset.index;
                cart[index].quantity = parseInt(this.value);
                localStorage.setItem("cart", JSON.stringify(cart));
                updateCartUI(); // Cập nhật lại UI mà không cần reload
            });
        });

        document.querySelectorAll(".remove-btn").forEach(button => {
            button.addEventListener("click", function () {
                let index = this.dataset.index;
                cart.splice(index, 1);
                localStorage.setItem("cart", JSON.stringify(cart));
                updateCartUI(); // Cập nhật lại UI mà không cần reload
            });
        });
    }

    updateCartUI();
});

document.getElementById('shipToDifferentAddress').addEventListener('change', function() {
    document.querySelector('.alternate-address').style.display = this.checked ? 'block' : 'none';
});
async function fetchShippings() {
    const options = document.getElementById("shipping-options");
    let temp = "";
    try {
        const response = await fetch(`http://localhost:8080/public/shippings`, {
            method: "GET"
        });

        if (!response.ok) {
            throw new Error(`Lỗi HTTP! Mã trạng thái: ${response.status}`);
        }

        const data = await response.json();
        console.log("Dữ liệu nhận được:", data);
        data.forEach(shipping => {
            temp += `
                <label class="shipping-option">
                    <input type="radio" name="shipping-method" value="${shipping.shippingFee}" data-name="${shipping.nameShipping}">
                    <div class="shipping-content">
                        <span class="shipping-title">${shipping.nameShipping}</span>
                        <span class="shipping-price"><strong>${shipping.shippingFee.toLocaleString("vi-VN")} đ</strong> (${shipping.delivery_time})</span>
                    </div>
                </label>`;
        });

        options.innerHTML = temp;

        // Gán sự kiện cho các input radio sau khi đã thêm vào DOM
        document.querySelectorAll("input[name='shipping-method']").forEach(input => {
            input.addEventListener("change", function () {
                updateFinalTotal();
            });
        });

    } catch (error) {
        console.error("Lỗi khi tải dữ liệu:", error);
    }
}

fetchShippings()
function updateFinalTotal() {
    let cart = JSON.parse(localStorage.getItem("cart")) || [];
    let totalPrice = cart.reduce((sum, product) => sum + product.totalOriginalPrice * product.quantity, 0);
    let totalDiscount = cart.reduce((sum, product) => sum + (product.totalOriginalPrice - product.finalPrice) * product.quantity, 0);
    
    let selectedShipping = document.querySelector("input[name='shipping-method']:checked");
    let shippingFee = selectedShipping ? parseFloat(selectedShipping.value) : 0; 
    document.getElementById("shipping-fee").innerHTML = shippingFee.toLocaleString("vi-VN") + " đ";
    let discountData = JSON.parse(localStorage.getItem("selectedDiscount")) || { code: "", value: 0 };
    let discountValue = discountData.value || 0;  
    let finalAmount = totalPrice - totalDiscount + shippingFee - discountValue;

    document.getElementById("final-total").innerText = Math.round(finalAmount).toLocaleString("vi-VN") + " đ";
}
function updateDiscount(){
        let discountData = JSON.parse(localStorage.getItem("selectedDiscount")) || { code: "", value: 0 };
    let discountValue = discountData.value || 0;  
    console.log(discountValue )
    var discountAmount= document.getElementById("discount-amount");
    let discountValue1 = parseFloat(discountAmount.innerText.replace(/[^\d.-]/g, ''));
    console.log(discountValue1)
   var temp =  discountValue1-discountValue;
   discountAmount.innerHTML = temp.toLocaleString("vi-VN") + " đ";
}
updateFinalTotal();
let discountCodes = [
    { code: "SALE50", value: 50000 },
    { code: "VIP100", value: 100000 },
    { code: "FREESHIP", value: 0 },
];

function toggleDiscountList() {
    let list = document.getElementById("discount-list");
    list.style.display = (list.style.display === "block") ? "none" : "block";
}

function applyDiscount(code, value, event) {

    document.getElementById("selected-discount").innerText = `${code} (-${value.toLocaleString("vi-VN")} đ)`;
    localStorage.setItem("selectedDiscount", JSON.stringify({ code, value }));
    console.log("askfhkasdhjklasd")

    // Xóa class 'selected' khỏi các mục khác
    document.querySelectorAll(".discount-item").forEach(li => li.classList.remove("selected"));

    if (event) {
        event.currentTarget.classList.add("selected");
    }

    document.getElementById("coupon-discount").innerHTML = `-${value.toLocaleString("vi-VN")} đ`;

    let discountAmountElement = document.getElementById("discount-amount");
    
    
   // Lấy lại tổng giảm giá từ localStorage hoặc mặc định 0
   let discountValue = JSON.parse(localStorage.getItem("selectedDiscount"))?.value || 0;

  //  Cập nhật đúng giá trị giảm giá
   discountAmountElement.innerText = `- ${Math.round(discountValue).toLocaleString("vi-VN")} đ`;
    console.log(discountValue + "discount")

   updateFinalTotal();
    document.getElementById("discount-list").style.display = "none";
}


const availableDiscounts = {
    "SALE50": 50000,
    "VIP100": 100000,
    "FREESHIP": 0
};

function toggleDiscountList() {
    let list = document.getElementById("discount-list");
    list.style.display = (list.style.display === "block") ? "none" : "block";
}

function applyDiscount(code, value, event = null) {
    document.getElementById("selected-discount").innerText = `${code} (-${value.toLocaleString("vi-VN")} đ)`;
    localStorage.setItem("selectedDiscount", JSON.stringify({ code, value }));
    

    document.querySelectorAll(".discount-item").forEach(li => li.classList.remove("selected"));

    if (event) {
        event.currentTarget.classList.add("selected");
    }

    document.getElementById("coupon-discount").innerHTML = `-${value.toLocaleString("vi-VN")} đ`;

    let discountData = JSON.parse(localStorage.getItem("selectedDiscount")) || { code: "", value: 0 };
    let discountValue = discountData.value || 0;  
    console.log(discountValue )
    var discountAmount= document.getElementById("discount-amount");
    let discountValue1 = parseFloat(discountAmount.innerText.replace(/[^\d.-]/g, ''));
    console.log(discountValue1)
   var temp =  discountValue1-discountValue;
   discountAmount.innerHTML = temp.toLocaleString("vi-VN") + " đ";
    document.getElementById("discount-list").style.display = "none";
}

function applyManualDiscount() {
    let inputCode = document.getElementById("discount-input").value.trim().toUpperCase();

    // Kiểm tra nếu danh sách giảm giá hợp lệ
    if (typeof availableDiscounts !== "undefined" && availableDiscounts[inputCode] !== undefined) {
        applyDiscount(inputCode, availableDiscounts[inputCode], null);
    } else {
        // Hiển thị thông báo lỗi thay vì alert
        const errorElement = document.getElementById("discount-error");
        errorElement.innerText = "❌ Mã giảm giá không hợp lệ!";
        errorElement.style.display = "block";
    }
}

async function fetchDiscount() {
    const token = localStorage.getItem("token");
    try {
        const response = await fetchWithToken(`http://localhost:8080/user/discounts`, {
            method: "GET"
        }); 
        if (!response.ok) {
            throw new Error(`Lỗi: ${response.status}`);
        }

        console.log("Token hiện tại:", token);
        const discount = document.getElementById("discount-list");
        discount.innerHTML = "";  // 🔥 XÓA danh sách cũ

        let temp = "";
        const data = await response.json();
        console.log(data);
        
        data.forEach(discount => {
            temp += `<li class="discount-item" onclick="applyDiscount('${discount.discountCode}', ${discount.discountAmount}, event)">
                        <div class="discount-header">
                            <span class="discount-badge">Giảm giá</span>
                            <span class="discount-title">Giảm ${discount.discountAmount.toLocaleString("vi-VN")} đ</span>
                        </div>
                        <div class="discount-info">
                            <span class="discount-status">Còn lại <strong>${discount.quantityUsed}</strong> - Hết hạn: <span class="discount-time">${discount.endDate}</span></span>
                        </div>
                        <button class="copy-button" onclick="copyCode('${discount.discountCode}')">Copy mã</button>
                    </li>`;
        });

        discount.innerHTML = temp;
    } catch (error) {
        console.error("Lỗi khi gọi API:", error);
    }
}


function copyCode(code) {
    navigator.clipboard.writeText(code);
    alert("Đã sao chép mã: " + code);
}
fetchDiscount()
$(document).ready(function () {
    // 🔥 Ẩn/hiện địa chỉ giao hàng khác khi chọn checkbox
    $("#shipToDifferentAddress").change(function () {
        if ($(this).is(":checked")) {
            $(".alternate-address").show();
        } else {
            $(".alternate-address").hide();
        }
    });

    // 🏢 Hàm tải tỉnh/thành từ API
    function loadProvinces(selectID) {
        $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data) {
            if (data.error === 0) {
                $.each(data.data, function (key, val) {
                    $(selectID).append(`<option value="${val.id}">${val.full_name}</option>`);
                });
            }
        });
    }

    // 📍 Hàm tải quận/huyện từ API
    function loadDistricts(provinceID, districtSelectID, wardSelectID) {
        $(districtSelectID).html('<option value="">Chọn quận/huyện</option>');
        $(wardSelectID).html('<option value="">Chọn phường/xã</option>'); // Reset phường/xã
        if (provinceID) {
            $.getJSON(`https://esgoo.net/api-tinhthanh/2/${provinceID}.htm`, function (data) {
                if (data.error === 0) {
                    $.each(data.data, function (key, val) {
                        $(districtSelectID).append(`<option value="${val.id}">${val.full_name}</option>`);
                    });
                }
            });
        }
    }

    // 🏠 Hàm tải phường/xã từ API
    function loadWards(districtID, wardSelectID) {
        $(wardSelectID).html('<option value="">Chọn phường/xã</option>');
        if (districtID) {
            $.getJSON(`https://esgoo.net/api-tinhthanh/3/${districtID}.htm`, function (data) {
                if (data.error === 0) {
                    $.each(data.data, function (key, val) {
                        $(wardSelectID).append(`<option value="${val.id}">${val.full_name}</option>`);
                    });
                }
            });
        }
    }

    // 🚀 Tải danh sách tỉnh/thành khi trang tải
    loadProvinces("#province");
    loadProvinces("#alt_province");

    // 🎯 Xử lý khi chọn tỉnh/thành (địa chỉ chính)
    $("#province").change(function () {
        loadDistricts($(this).val(), "#district", "#ward");
    });

    // 🎯 Xử lý khi chọn quận/huyện (địa chỉ chính)
    $("#district").change(function () {
        loadWards($(this).val(), "#ward");
    });

    // 🎯 Xử lý khi chọn tỉnh/thành (địa chỉ thay thế)
    $("#alt_province").change(function () {
        loadDistricts($(this).val(), "#alt_district", "#alt_ward");
    });

    // 🎯 Xử lý khi chọn quận/huyện (địa chỉ thay thế)
    $("#alt_district").change(function () {
        loadWards($(this).val(), "#alt_ward");
    });
});