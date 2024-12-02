import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    user: Object,
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/carocbd/cm44f9gnr011q01si60j81c45",
      // center: [this.userValue.longitude, this.userValue.latitude],
      zoom: 7
    })
    console.log("create map");
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    console.log("add markers to map");
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup({
        className: 'custom-popup',
        closeButton: true,
        closeOnClick: true,
        anchor: "center",
        maxWidth: "none"
      }).setHTML(marker.info_event_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.coordinates.lng, marker.coordinates.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    console.log("fit map to markers");
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.coordinates.lng, marker.coordinates.lat]))
    this.map.fitBounds(bounds, { padding: 50, maxZoom: 90, duration: 2000 })
  }
}
