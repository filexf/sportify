import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reset-form"
export default class extends Controller {
  // connect() {
  //   console.log("coucou on est dans le connect du form controller")
  // };
  reset() {
    this.element.reset()
  }

}
