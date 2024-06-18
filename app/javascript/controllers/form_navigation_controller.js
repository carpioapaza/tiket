import {Controller} from 'stimulus';

export default class extends Controller {
  static targets = ['section'];

  initialize() {
    this.showSection(0);
  }

  showSection(index) {
    this.sectionTargets.forEach((section, i) => {
      section.classList.toggle('d-none', i !== index);
    });
    this.currentSectionIndex = index;
  }

  next() {
    if (this.currentSectionIndex < this.sectionTargets.length - 1) {
      this.showSection(this.currentSectionIndex + 1);
    }
  }

  previous() {
    if (this.currentSectionIndex > 0) {
      this.showSection(this.currentSectionIndex - 1);
    }
  }
}
