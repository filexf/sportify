import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="like-button"
export default class extends Controller {
  static targets = ["like"]
  connect() {
    console.log("bienvenue dans le like-controller")
  }

  like(){
    console.log(this.currentTarget.attributes);
    // this.currentTarget.setAttribute('style','fill:red')
  }
}
