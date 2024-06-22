import {Controller} from 'stimulus';

export default class extends Controller {
  static targets = ['quantity', 'subtotal', 'hiddenField'];

  update() {
    let subtotal = 0;

    this.quantityTargets.forEach((quantityInput) => {
      const quantity = parseInt(quantityInput.value);
      const price = parseFloat(quantityInput.dataset.price);
      const ticketId = quantityInput.dataset.id;

      subtotal += quantity * price;

      const hiddenField = this.hiddenFieldTargets.find(
        (field) => field.name === `tickets[${ticketId}]`
      );
      hiddenField.value = quantity;
    });

    this.subtotalTarget.innerText = subtotal.toFixed(2);
  }
}
