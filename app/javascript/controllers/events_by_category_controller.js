import {Controller} from 'stimulus';
import Chart from 'chart.js/auto';

export default class extends Controller {
  static targets = ['chart'];

  connect() {
    this.loadChart();
  }

  loadChart() {
    const ctx = this.chartTarget.getContext('2d');

    const labels = JSON.parse(this.chartTarget.dataset.eventsByCategoryLabels);
    const data = JSON.parse(this.chartTarget.dataset.eventsByCategoryData);

    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [
          {
            label: 'Cantidad de eventos por categoría',
            data: data,
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1,
          },
        ],
      },
      options: {
        scales: {
          y: {
            beginAtZero: true,
          },
        },
      },
    });
  }
}
