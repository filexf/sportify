import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-submit"
export default class extends Controller {
  connect() {
    console.log("submit controller");
  }

  submit(){
    console.log("ici");
    this.element.requestSubmit();
  }
}
