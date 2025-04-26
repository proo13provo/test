const ctx = document.getElementById('salesChart').getContext('2d');
new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
        datasets: [{
            label: 'Doanh thu',
            data: [5000, 8000, 10000, 7500, 9500, 12000, 8000, 6200, 9400, 7600, 8400, 8000],
            borderColor: 'rgba(75, 192, 192, 1)',
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            fill: true,
            tension: 0.4,
            datalabels: {
                display: true,
                color: 'rgba(0, 0, 0, 0.7)',
                font: {
                    size: 12,
                    weight: 'bold'
                },
                align: 'top',
                anchor: 'end'
            }
        }]
    },
    options: {
        plugins: {
            legend: {
                display: true,
                position: 'top'
            },
            tooltip: {
                enabled: true,
            },
            datalabels: {
                display: true,
                color: '#000',
                font: {
                    size: 12,
                    weight: 'bold'
                },
                anchor: 'end',
                align: 'top'
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                max: Math.ceil(Math.max(...[5000, 8000, 10000, 7500, 9500, 12000, 8000, 6200, 9400, 7600, 8400, 8000]) * 1.1)
            }
        }
    },
    plugins: [ChartDataLabels] // Kích hoạt plugin
});
