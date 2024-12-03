import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pills"
export default class extends Controller {
  static targets = ["togglable"]
  connect() {
    // console.log("Mouette")
  }

  filter(event){

// tous les params
const params = 
// fetch index
// json

    const sport = event.currentTarget.innerText
    this.togglableTargets.forEach((element) => {
      event.currentTarget.classList.toggle("active")
      console.log(element.dataset.sportName)
      if (sport !== element.dataset.sportName) {
        element.classList.add("d-none")
      } else {
        element.classList.remove("d-none")
      }
    });
    }
}
