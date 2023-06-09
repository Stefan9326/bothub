import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-price"
export default class extends Controller {
  static targets = [ "display" ]

  connect() {
    document.addEventListener('dateSelected', this.handleDateSelected.bind(this));
  }

  disconnect() {
    document.removeEventListener('dateSelected', this.handleDateSelected.bind(this));
  }

  handleDateSelected(event) {
    const priceElement = document.querySelector('.price')
    const price = parseFloat(priceElement.textContent)
    const selectedDate = event.detail
    this.displayTarget.textContent = `Total price: €${(price * selectedDate).toFixed(2)}`
  }
}
