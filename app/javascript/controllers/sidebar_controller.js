// sidebar_controller.js
import {Controller} from 'stimulus';

export default class extends Controller {
  static targets = ['navLink'];

  connect() {
    this.highlightActiveIcon();
  }

  highlightActiveIcon() {
    const currentPath = window.location.pathname;
    this.navLinkTargets.forEach((li) => {
      const link = li.querySelector('a');
      const href = link.getAttribute('href');

      if (currentPath.startsWith(href)) {
        li.classList.add('active');
      } else {
        li.classList.remove('active');
      }
    });
  }
}
