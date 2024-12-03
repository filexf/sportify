import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["toggle"]
  connect() {
    console.log("on est au toggler")
  }

  list(){
    console.log("liste");
    document.getElementById("list").checked = true;
  }

  map(){
    console.log("carte");
    document.getElementById("map").checked = true;
  }
}
