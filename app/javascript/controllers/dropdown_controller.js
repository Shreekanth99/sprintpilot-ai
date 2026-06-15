import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.boundClose = this.closeOnOutsideClick.bind(this)

    document.addEventListener(
      "click",
      this.boundClose
    )
  }

  disconnect() {
    document.removeEventListener(
      "click",
      this.boundClose
    )
  }

  toggle(event) {
    event.preventDefault()
    event.stopPropagation()

    this.menuTarget.classList.toggle(
      "hidden"
    )
  }

  closeOnOutsideClick(event) {
    if (
      !this.element.contains(event.target) &&
      !this.menuTarget.classList.contains("hidden")
    ) {
      this.menuTarget.classList.add("hidden")
    }
  }
}