import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {

  connect() {
    flatpickr(this.element, {
      mode: "range",
      onChange: this.updateDisplay.bind(this)
    });
  }

  updateDisplay(selectedDates, instance) {
    const [startDate, endDate] = selectedDates;
    if (selectedDates.length === 2) {
      const date1 = new Date(startDate.toISOString().slice(0, 10));
      const date2 = new Date(endDate.toISOString().slice(0, 10));

      const diffInMs = Math.abs(date2 - date1);
      const diffInDays = diffInMs / (1000 * 60 * 60 * 24);

      const price = document.querySelector('price')
      const display = document.querySelector('display')

      console.log(price)
      console.log(display)
      // this.displayTarget.innerHTML = `${price} x ${event.detail[0]} = ${price * event.detail[0]}`
    }
  }
}
