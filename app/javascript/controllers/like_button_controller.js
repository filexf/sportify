import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="like-button"
export default class extends Controller {
  static targets = ["like"]
  connect() {
    console.log("bienvenue dans le like-controller")
  }

  like(){
    // console.log(this.likeTarget);
    this.likeTarget.setAttribute('style','fill:red');
    this.likeTarget.setAttribute('')
    // this.likeTarget.setAttribute('style','fill:none')
  }
}
