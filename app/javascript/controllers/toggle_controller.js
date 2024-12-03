import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  connect() {
    console.log("on est au toggler")
  }

  list(){
    console.log("liste");
    const element = document.getElementById("list").parentElement;
    const other_element = document.getElementById("map").parentElement;
    console.log(element);
    element.classList.add("toggle-active");
    other_element.classList.remove("toggle-active");
  }

  map(){
    console.log("carte");
    const element = document.getElementById("map").parentElement;
    const other_element = document.getElementById("list").parentElement;
    console.log(element);
    element.classList.add("toggle-active");
    other_element.classList.remove("toggle-active");
  }
}
