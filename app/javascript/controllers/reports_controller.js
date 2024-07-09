// app/javascript/controllers/reports_controller.js

import {Controller} from 'stimulus';

export default class extends Controller {
  static targets = ['button'];

  generateReport(event) {
    event.preventDefault();
    this.buttonTarget.innerHTML = 'Generando...';

    fetch(event.currentTarget.href, {
      method: 'POST',
      headers: {
        'X-CSRF-Token': document.querySelector('[name=csrf-token]').content,
        'Content-Type': 'application/json',
        Accept: 'application/javascript',
      },
    }).then((response) => {
      if (response.ok) {
        setTimeout(() => {
          window.location.href = '/general_summary.pdf';
          this.buttonTarget.innerHTML = 'Generar PDF';
        }, 2000);
      } else {
        this.buttonTarget.innerHTML = 'Generar PDF';
        alert('Hubo un problema al generar el PDF.');
      }
    });
  }
}
