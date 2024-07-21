import {Controller} from 'stimulus';
import {Carousel} from 'bootstrap';

export default class extends Controller {
  connect() {
    const interval = parseInt(this.data.get('interval')) || 1500;
    const carouselElement = this.element;

    this.carousel = new Carousel(carouselElement, {
      interval: interval,
    });

    this.element.addEventListener('click', (event) => {
      if (event.target.dataset.bsSlide) {
        const slide = event.target.dataset.bsSlide;
        if (slide === 'prev') {
          this.carousel.prev();
        } else if (slide === 'next') {
          this.carousel.next();
        }
      }
    });
  }
}
