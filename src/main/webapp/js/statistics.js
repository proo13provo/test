// Doanh thu sản phẩm (Bar chart)
var ctx1 = document.getElementById('productSalesChart').getContext('2d');
var productSalesChart = new Chart(ctx1, {
    type: 'bar', // Kiểu biểu đồ là cột
    data: {
        labels: ['Nấm Linh Chi', 'Nấm Cordyceps', 'Nấm Hương', 'Nấm Bào Ngư'], // Tên sản phẩm
        datasets: [{
            label: 'Doanh thu (VND)', // Chú thích cho biểu đồ
            data: [1200000, 800000, 600000, 400000], // Dữ liệu doanh thu của các sản phẩm
            backgroundColor: 'rgba(0, 123, 255, 0.5)', // Màu nền của các cột
            borderColor: 'rgba(0, 123, 255, 1)', // Màu viền của các cột
            borderWidth: 1, // Độ dày viền của các cột
            datalabels: {
                align: 'top', // Hiển thị số liệu ở phía trên các cột
                anchor: 'end', // Gắn số liệu vào cuối cột
                color: '#000', // Màu chữ của số liệu
                font: {
                    weight: 'bold',
                    size: 12 // Kích thước font
                }
            }
        }]
    },
    options: {
        responsive: true, // Biểu đồ sẽ tự động thay đổi kích thước khi thay đổi kích thước màn hình
        scales: {
            y: {
                beginAtZero: true, // Trục Y bắt đầu từ 0
                max: Math.ceil(Math.max(...[1200000, 800000, 600000, 400000]) * 1.1)
            }
        },
        plugins: {
            datalabels: {
                display: true, // Hiển thị số liệu trên biểu đồ
            }
        }
    },
    plugins: [ChartDataLabels] // Thêm plugin chartjs-plugin-datalabels
});

// Doanh thu theo tháng (Line chart) với dữ liệu mới
var ctx2 = document.getElementById('monthlyRevenueChart').getContext('2d');
var monthlyRevenueChart = new Chart(ctx2, {
    type: 'line', // Kiểu biểu đồ là đường
    data: {
        labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'], // Các tháng trong năm
        datasets: [{
            label: 'Doanh thu theo tháng (VND)', // Chú thích cho biểu đồ
            data: [5000, 8000, 10000, 7500, 9500, 12000, 8000, 6200, 9400, 7600, 8400, 8000], // Dữ liệu doanh thu theo tháng mới
            borderColor: 'rgba(75, 192, 192, 1)', // Màu đường của biểu đồ
            tension: 0.1, // Độ cong của đường
            fill: false, // Không làm đầy dưới đường biểu đồ
            datalabels: {
                display: true, // Hiển thị số liệu trên các điểm của đường
                color: '#000', // Màu chữ của số liệu
                font: {
                    weight: 'bold',
                    size: 12 // Kích thước font
                },
                formatter: (value) => value.toLocaleString() // Định dạng giá trị theo định dạng tiền tệ
            }
        }]
    },
    options: {
        responsive: true, // Biểu đồ sẽ tự động thay đổi kích thước khi thay đổi kích thước màn hình
        plugins: {
            legend: {
                display: true, // Hiển thị legend (chú thích)
                position: 'top' // Vị trí của legend là phía trên biểu đồ
            },
            datalabels: {
                display: true, // Hiển thị số liệu trên biểu đồ
            }
        },
        scales: {
            y: {
                beginAtZero: true, // Trục Y bắt đầu từ 0
                max: Math.ceil(Math.max(...[5000, 8000, 10000, 7500, 9500, 12000, 8000, 6200, 9400, 7600, 8400, 8000]) * 1.1)
            }
        }
    },
    plugins: [ChartDataLabels] // Thêm plugin chartjs-plugin-datalabels
});
