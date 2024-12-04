import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  connect() {
    console.log("on est au toggler")
  }

  list(){
    console.log("liste");
    const element = document.getElementById("list").parentElement;
    const element_icon = document.getElementById("list-icon");

    const other_element = document.getElementById("map").parentElement;
    const other_element_icon = document.getElementById("map-icon")

    element.classList.add("toggle-active");
    element_icon.classList.add("icon-active");
    element_icon.classList.remove("icon-unactive");

    other_element.classList.remove("toggle-active");
    other_element_icon.classList.remove("icon-active");
    other_element_icon.classList.add("icon-unactive");
  }

  map(){
    console.log("carte");
    const element = document.getElementById("map").parentElement;
    const element_icon = document.getElementById("map-icon");

    const other_element = document.getElementById("list").parentElement;
    const other_element_icon = document.getElementById("list-icon")


    element.classList.add("toggle-active");
    element_icon.classList.add("icon-active");
    element_icon.classList.remove("icon-unactive");

    other_element.classList.remove("toggle-active");
    other_element_icon.classList.remove("icon-active");
    other_element_icon.classList.add("icon-unactive");
  }
}
