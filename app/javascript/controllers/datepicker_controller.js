import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {

  connect() {
    flatpickr(this.element, {
      mode: "range",
      onChange: this.updateDisplay
    });
  }

  updateDisplay(selectedDates, dateStr, instance) {
    const [startDate, endDate] = selectedDates;
    if (selectedDates.length === 2) {
      const diffInMs = selectedDates[1] - selectedDates[0]
      const diffInDays = diffInMs / (1000 * 60 * 60 * 24)

      const event = new CustomEvent('dateSelected', {
        detail: diffInDays,
        bubbles: true,
        cancelable: true
      })
      document.dispatchEvent(event);
    }
    }

}
