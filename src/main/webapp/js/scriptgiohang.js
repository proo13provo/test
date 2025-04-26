








function giaohang() {
    const giaohangElement = document.getElementById('giaohang');
  
  
    if (giaohangElement.style.display === 'none' || giaohangElement.style.display === '') {
     
      giaohangElement.style.display = 'block';
    } 
  }
  const tongtien = 555;

  let pri = []; 
  function calculateShipping() {
      const thanhPho = document.getElementById('thanhPho').value;
      const quan = document.getElementById('quan').value;
  
      const shippingRates = {
          "Hà Nội": { "Quận Ba Đình": "30.000", "Quận Long Biên": "35.000", "Quận Hoàn Kiếm": "25.000" },
          "Tp.Hồ Chí Minh": { "Quận 1": "40.000", "Quận 2": "45.000" },
          "Tp.Cần Thơ": { "Quận Ninh Kiều": "50.000" },
          "Tp.Hải Phòng": { "Quận Hồng Bàng": "60.000" },
          "Tp.Vĩnh Long": { "Quận Vĩnh Long": "55.000" },
          "Bình Định": { "Quận Quy Nhơn": "65.000" }
      };
  
      if (thanhPho && quan) {
          const fee = shippingRates[thanhPho] && shippingRates[thanhPho][quan];
          if (fee !== undefined) {
              document.getElementById('phigiaohang').innerHTML = `Phí giao hàng: ${fee} VND`;
              localStorage.setItem('shippingFee', fee);
  
              // Cập nhật tổng tiền (sản phẩm + phí giao hàng)
              const currentTotal = parseInt(document.getElementById('tongtienthanhtoan').innerText.replace(/\./g, '').replace('đ', '').trim());
              const shippingFee = parseInt(fee.replace(/\./g, '').trim());
              const finalTotal = currentTotal + shippingFee;
  
              pri.push({ price: finalTotal });
  
              document.getElementById('tongtienthanhtoan').innerText = `${finalTotal.toLocaleString()}đ`;
          } else {
              document.getElementById('phigiaohang').innerHTML = 'Phí giao hàng không có sẵn cho khu vực này.';
          }
      } else {
          document.getElementById('phigiaohang').innerHTML = 'Vui lòng chọn thành phố và quận để tính phí.';
      }
  
   
      let totaltamtinh = document.getElementById('tamtinhpriceright').innerText.replace(/\./g, '').replace('đ', '').trim();
      const productdetails = {
          totaltamtinh1: parseInt(totaltamtinh),
          totalthanhtoan1: pri.length > 0 ? pri[0].price : 0
      };
  
      let carttotal = JSON.parse(localStorage.getItem('carttotal')) || [];
      carttotal.push(productdetails);
      localStorage.setItem('carttotal', JSON.stringify(carttotal));
  }
function increaseQuantity(button) {
    // Lấy id của ô input tương ứng từ nút được nhấn
    const quantityInput = button.parentElement.querySelector('input');
    const subtotalField = document.getElementById(`subtotal-${quantityInput.id.split('-')[1]}`);

    let quantity = parseInt(quantityInput.value);
    quantity += 1; // Tăng số lượng

    // Cập nhật giá trị
    quantityInput.value = quantity;

    // Tính toán lại tạm tính (subtotal) và cập nhật
    const price = parseInt(quantityInput.getAttribute('data-price'));
    subtotalField.innerText = new Intl.NumberFormat().format(quantity * price) + ' đ';
}

function decreaseQuantity(button) {
    // Lấy id của ô input tương ứng từ nút được nhấn
    const quantityInput = button.parentElement.querySelector('input');
    const subtotalField = document.getElementById(`subtotal-${quantityInput.id.split('-')[1]}`);

    let quantity = parseInt(quantityInput.value);
    if (quantity > 1) {
        quantity -= 1; // Giảm số lượng

        // Cập nhật giá trị
        quantityInput.value = quantity;

        // Tính toán lại tạm tính (subtotal) và cập nhật
        const price = parseInt(quantityInput.getAttribute('data-price'));
        subtotalField.innerText = new Intl.NumberFormat().format(quantity * price) + ' đ';
    }
}