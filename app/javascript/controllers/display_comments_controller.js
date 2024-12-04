import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-comments"
export default class extends Controller {
  static targets = ["comment"]

  connect() {
    console.log("connecté");
  }

  display() {
    console.log("clickéééééé");
    this.commentTargets.foreach((element) => {
      element.currentTarget.classList.toggle("d-none");
    }
  )

  }
}
