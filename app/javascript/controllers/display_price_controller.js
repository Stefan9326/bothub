import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-price"
export default class extends Controller {
  static targets = ["price", "display"]

  setDisplayContent(event) {
    if (this.hasPriceTarget && this.hasDisplayTarget) {
      const price = parseInt(this.priceTarget.textContent, 10)
      console.log(this.priceTarget.textContent)
      console.log(event.detail)
      console.log(this)
      console.log(this.displayTarget)
      console.log(event.detail[0]);
      this.displayTarget.innerHTML = `${price} x ${event.detail[0]} = ${price * event.detail[0]}`
    }
  }
}
