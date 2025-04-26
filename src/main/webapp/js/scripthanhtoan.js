let cart = JSON.parse(localStorage.getItem('cart')) || [];
let lastProduct = cart[cart.length - 1];
let carttotal = JSON.parse(localStorage.getItem('carttotal')) || [];
let lastTotal = carttotal[carttotal.length - 1];


const shippingFee = localStorage.getItem('shippingFee');
if (shippingFee) {
    document.getElementById('phigiaohang').innerHTML = `Phí giao hàng: ${shippingFee} VND`;
}


document.getElementById('tensp').innerHTML = lastProduct.name;
document.getElementById('masp').innerHTML = lastProduct.id;
document.getElementById('countspthanhtoan').innerHTML = lastProduct.quantity;
document.getElementById('price').innerHTML = lastProduct.price;
document.getElementById('tamtinhprice').innerHTML = lastProduct.price;

var total = lastProduct.price * lastProduct.quantity;
document.getElementById('price').innerHTML = `${lastTotal.totaltamtinh1} VND`;

document.getElementById('tamtinhprice').innerHTML = `${lastTotal.totaltamtinh1} VND`;

document.getElementById('totalsp1').innerHTML =  `${lastTotal.totalthanhtoan1} VND`;


function validateForm() {
    const requiredFields = [
        { selector: ".inputname[placeholder='Họ và tên']", message: "Họ và tên là bắt buộc!" },
        { selector: ".inputname[placeholder='Nhập số điện thoại']", message: "Số điện thoại là bắt buộc!" },
        { selector: ".inputname[placeholder='Toà nhà, số nhà, tên đường']", message: "Địa chỉ là bắt buộc!" },
        
        { selector: ".inputname[type='email']", message: "Email là bắt buộc!" }
    ];
    

    for (let field of requiredFields) {
        const input = document.querySelector(field.selector);
        if (!input || !input.value.trim()) {
            alert(field.message);
            return false;  
        }
    }

    // Kiểm tra checkbox điều khoản
    const checkbox = document.querySelector(".formsubmit input[type='checkbox']");
    if (!checkbox.checked) {
        alert("Bạn phải đồng ý với điều khoản và điều kiện.");
        return false;
    }

    return true; 
}


document.querySelector(".formsubmit button").addEventListener("click", function(event) {
    if (!validateForm()) {
        event.preventDefault();  
    }
});
function toggleBox() {
    const box = document.getElementById("newBox");
    if (box.classList.contains("active")) {
        box.classList.remove("active");
       
        box.style.height = box.scrollHeight + 'px';
        setTimeout(() => (box.style.height = '0'), 0);
    } else {
        box.classList.add("active");
        
        box.style.height = box.scrollHeight + 'px';
        setTimeout(() => (box.style.height = 'auto'), 300); 
    }
}
function toggleGuide() {
    var guide = document.getElementById("guide");
    guide.classList.toggle("hidden");
  }

document.addEventListener('DOMContentLoaded', () => {
    const subButtonthanhtoan = document.getElementById("subspthanhtoan");
    const addButtonthanhtoan = document.getElementById("addspthanhtoan");
    const countSPthanhtoan = document.getElementById("countspthanhtoan");


    function updateCount(value) {
        let countProduct = parseInt(countSPthanhtoan.innerHTML);
        countProduct += value;
        if (countProduct < 1) countProduct = 1;
        countSPthanhtoan.innerHTML = "asdalshdas";
    }

    subButtonthanhtoan.addEventListener('click', () => updateCount(-1));
    addButtonthanhtoan.addEventListener('click', () => updateCount(1));
});
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
}