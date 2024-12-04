import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-comments"
export default class extends Controller {
  static targets = ["comment"]
  connect() {
    console.log("connecté dans le display-comments controller");
  }

  display() {
    console.log(this.commentTarget.children[1]);
    this.commentTarget.children[1].classList.toggle("d-none");
    }
}
