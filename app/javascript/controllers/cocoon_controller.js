import {Controller} from 'stimulus';
import $ from 'jquery';

export default class extends Controller {
  static targets = ['container'];

  connect() {
    // This will initialize Cocoon
    $(this.containerTarget).on('cocoon:after-insert', (e, insertedItem) => {
      console.log('Item added');
      // You can add more logic here if needed
    });

    $(this.containerTarget).on('cocoon:after-remove', (e, removedItem) => {
      console.log('Item removed');
      // You can add more logic here if needed
    });
  }
}
