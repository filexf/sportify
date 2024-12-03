import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    console.log("controller datepickr connecté")
    flatpickr(this.element, {
        dateFormat: "d-m-Y",
        minDate: "today",
        maxDate: new Date().fp_incr(30) // On peut pas faire d'event dans plus d'un mois
      })
  }

  open_as_calendar(){
    console.log("depuis le mode calendrier")
    console.log(this.element)
    flatpickr(this.element, {
        dateFormat: "d-m-Y",
        minDate: "today",
        maxDate: new Date().fp_incr(30) // On peut pas faire d'event dans plus d'un mois
      })
  }

  open_as_time_picker(){
    console.log("depuis le mode time picker")
    console.log(this.element)
    flatpickr(this.element, {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i",
        time_24hr: true
      })
  }
}
