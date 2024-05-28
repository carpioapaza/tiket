import {Controller} from 'stimulus';

export default class extends Controller {
  static targets = ['page'];

  connect() {
    this.showPage(1);
  }

  nextPage() {
    const currentPage = parseInt(this.data.get('currentPage'));
    this.showPage(currentPage + 1);
  }

  previousPage() {
    const currentPage = parseInt(this.data.get('currentPage'));
    this.showPage(currentPage - 1);
  }

  showPage(page) {
    this.data.set('currentPage', page);
    this.pageTargets.forEach((pageTarget, index) => {
      const pageNumber = index + 1;
      if (pageNumber === page) {
        pageTarget.style.display = 'block';
      } else {
        pageTarget.style.display = 'none';
      }
    });
  }
}
