// Chuyển hướng người dùng
function redirectToGuestInfo() {
    const loggedInUser = sessionStorage.getItem("loggedInUser");

    if (!loggedInUser) {
        const isGuest = confirm("Bạn chưa đăng nhập. Bạn có muốn đăng nhập không?");
        if (isGuest) {
            window.location.href = "login.html";
        } else {
            alert("Vui lòng đăng nhập để truy cập.");
        }
    } else if (loggedInUser === "19130083@st.hcmuaf.edu.vn") {
        window.location.href = "guest-info.html";
    } else {
        alert("Bạn không có quyền truy cập trang này.");
    }
}

// Hiển thị tên người dùng hiện tại
document.addEventListener("DOMContentLoaded", function () {
    // Lấy fullname từ sessionStorage
    const loggedInUserFullname = sessionStorage.getItem("loggedInUserFullname");

    if (loggedInUserFullname) {
        // Tách phần tên cuối
        const nameParts = loggedInUserFullname.trim().split(" ");
        const lastName = nameParts[nameParts.length - 1];

        // Cập nhật nội dung nút btn-warning
        const userNameBtn = document.getElementById("user-name-btn");
        if (userNameBtn) {
            userNameBtn.textContent = lastName;
        }
    }
});

// Quản lý hiển thị sản phẩm
document.addEventListener("DOMContentLoaded", () => {
    const itemsPerPage = 40; // Số sản phẩm trên mỗi trang
    const productItems = document.querySelectorAll(".product-list .nav-item");
    const totalProducts = productItems.length;
    const totalPages = Math.ceil(totalProducts / itemsPerPage);
    const pagination = document.querySelector(".pagination");

    // Hàm hiển thị sản phẩm của một trang
    function displayPage(page) {
        productItems.forEach((item, index) => {
            const itemPage = Math.floor(index / itemsPerPage) + 1;
            item.dataset.active = itemPage === page ? "true" : "false";
        });
    }

    // Hàm cập nhật phân trang
    function updatePagination(currentPage) {
        // Xóa nội dung cũ
        pagination.innerHTML = `
            <li class="page-item ${currentPage === 1 ? "disabled" : ""}">
                <a class="page-link prev-page" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>`;

        // Thêm các nút số trang
        for (let i = 1; i <= totalPages; i++) {
            pagination.innerHTML += `
                <li class="page-item ${i === currentPage ? "active" : ""}">
                    <a class="page-link" href="#" data-page="${i}">${i}</a>
                </li>`;
        }

        // Nút "Next"
        pagination.innerHTML += `
            <li class="page-item ${currentPage === totalPages ? "disabled" : ""}">
                <a class="page-link next-page" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>`;
    }

    // Xử lý sự kiện khi người dùng bấm nút phân trang
    pagination.addEventListener("click", event => {
        event.preventDefault();
        const target = event.target.closest("a");
        if (!target) return;

        const currentPage = parseInt(document.querySelector(".pagination .active a")?.dataset.page || 1);
        let newPage = currentPage;

        if (target.classList.contains("prev-page") && currentPage > 1) {
            newPage = currentPage - 1;
        } else if (target.classList.contains("next-page") && currentPage < totalPages) {
            newPage = currentPage + 1;
        } else if (target.dataset.page) {
            newPage = parseInt(target.dataset.page);
        }

        if (newPage !== currentPage) {
            displayPage(newPage);
            updatePagination(newPage);
        }
    });

    // Hiển thị trang đầu tiên
    displayPage(1);
    updatePagination(1);
});

document.addEventListener("DOMContentLoaded", function () {
    // Lấy danh sách sản phẩm
    const productItems = document.querySelectorAll(".product-item");

    // Bộ lọc loại sản phẩm
    const categoryLinks = document.querySelectorAll(".nav-link");
    categoryLinks.forEach(link => {
        link.addEventListener("click", function (event) {
            event.preventDefault();
            const category = this.textContent.trim().toUpperCase();
            filterProducts({ category });
        });
    });

    // Bộ lọc thứ tự
    const sortOptions = document.querySelectorAll(".dropdown-item");
    sortOptions.forEach(option => {
        option.addEventListener("click", function (event) {
            event.preventDefault();
            const sortType = this.textContent.trim();
            sortProducts(sortType);
        });
    });

    // Bộ lọc khoảng giá
    const priceRadios = document.querySelectorAll("input[name='priceRange']");
    priceRadios.forEach(radio => {
        radio.addEventListener("change", function () {
            const priceRange = this.value.split("-").map(Number);
            filterProducts({ priceRange });
        });
    });

    // Hàm lọc sản phẩm
    function filterProducts({ category, priceRange } = {}) {
        productItems.forEach(item => {
            let match = true;

            // Lọc theo loại sản phẩm
            if (category) {
                const productCategory = item.dataset.category.trim().toUpperCase();
                if (!productCategory.includes(category)) {
                    match = false;
                }
            }

            // Lọc theo khoảng giá
            if (priceRange && match) {
                const minPrice = parseInt(item.dataset.priceMin);
                const maxPrice = parseInt(item.dataset.priceMax);
                if (!(minPrice >= priceRange[0] && maxPrice <= priceRange[1])) {
                    match = false;
                }
            }

            // Cập nhật thuộc tính data-active của sản phẩm
            if (match) {
                item.setAttribute("data-active", "true"); // Đánh dấu sản phẩm phù hợp
            } else {
                item.setAttribute("data-active", "false"); // Đánh dấu sản phẩm không phù hợp
            }
        });
    }

    // Hàm sắp xếp sản phẩm
    function sortProducts(sortType) {
        const productList = document.querySelector(".product-list");
        const productArray = Array.from(productItems);

        productArray.sort((a, b) => {
            const aPrice = a.dataset.priceMin;
            const bPrice = b.dataset.priceMin;

            if (sortType.includes("thấp đến cao")) {
                return parseInt(aPrice) - parseInt(bPrice);
            } else if (sortType.includes("cao đến thấp")) {
                return parseInt(bPrice) - parseInt(aPrice);
            } else {
                return 0;
            }
        });

        // Cập nhật lại danh sách sản phẩm
        productList.innerHTML = "";
        productArray.forEach(item => productList.appendChild(item));
    }
});


function selectStore(storeName) {
    alert("Bạn đã chọn: " + storeName);
    document.getElementById("selectedStore").innerText = storeName;

    // Đóng modal bằng Bootstrap JavaScript
    var modalElement = document.getElementById("storeModal");
    var modalInstance = bootstrap.Modal.getInstance(modalElement);
    if (modalInstance) {
        modalInstance.hide();
    } else {
        new bootstrap.Modal(modalElement).hide();
    }
}
