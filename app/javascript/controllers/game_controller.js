import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="game"
export default class extends Controller {
  static targets = ['loading', 'winner'];
  connect() {}
  submitBet() {
    setTimeout(() => {
      this.loadingTarget.hidden = false;
    }, 500);

    setTimeout(() => {
      this.loadingTarget.hidden = true;
      this.winnerTarget.hidden = false;
    }, 1500);
  }
}
