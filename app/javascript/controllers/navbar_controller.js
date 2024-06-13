import {Controller} from 'stimulus';

export default class extends Controller {
  static targets = ['dropdown'];

  connect() {
    this.element.addEventListener('mouseenter', () => {
      this.dropdownTarget.classList.add('show');
    });

    this.element.addEventListener('mouseleave', () => {
      this.dropdownTarget.classList.remove('show');
    });
  }
}
