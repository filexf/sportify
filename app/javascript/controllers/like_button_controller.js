import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like-button"
export default class extends Controller {
  connect() {
    console.log("bienvenue dans le like-controller")
  }

  like(){
    console.log("liké !")
  }
}
