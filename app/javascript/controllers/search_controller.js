import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "display" ]

  connect() {
    this.search()
  }

  search() {
    const url = `/robots?query=${this.inputTarget.value}`

    fetch(url, {
      headers: {
        "Accept": "text/javascript"
      }
    })
    .then(response => response.text())
    .then(html => {
      this.displayTarget.innerHTML = html
    })
  }
}
