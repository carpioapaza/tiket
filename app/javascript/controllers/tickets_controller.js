import {Controller} from 'stimulus';

export default class extends Controller {
  static targets = ['tickets'];

  addTicket(event) {
    event.preventDefault();
    const content = document
      .querySelector('#ticket_template')
      .innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.ticketsTarget.insertAdjacentHTML('beforeend', content);
  }

  removeTicket(event) {
    event.preventDefault();
    event.target.closest('.nested-fields').remove();
  }
}
