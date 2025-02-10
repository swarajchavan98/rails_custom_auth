import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.isOpen = false;
    this.handleOutsideClick = this.handleOutsideClick.bind(this)
  }

  toggle(event) {
    event.stopPropagation();
    this.isOpen = !this.isOpen;

    if (this.isOpen) {
      this.menuTarget.classList.remove("hidden");
      document.addEventListener("click", this.handleOutsideClick);
    } else {
      this.menuTarget.classList.add("hidden");
      document.removeEventListener("click", this.handleOutsideClick);
    }
  }

  handleOutsideClick(event) {
    if (!this.element.contains(event.target)) {
      this.close();
    }
  }

  close() {
    this.isOpen = false;
    this.menuTarget.classList.add("hidden");
    document.removeEventListener("click", this.handleOutsideClick);
  }
}
