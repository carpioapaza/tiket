// sidebar_controller.js
import {Controller} from 'stimulus';

export default class extends Controller {
  static targets = ['navLink', 'menu'];

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

// Toggle popup super admin

  toggleMenu(event) {
    event.preventDefault();
    const menu = this.menuTarget;

    menu.classList.toggle('active-b');

    if (menu.classList.contains('active-b')) {
      menu.style.maxHeight = `${menu.scrollHeight}px`;
    } else {
      menu.style.maxHeight = null; 
    }
  }


}
