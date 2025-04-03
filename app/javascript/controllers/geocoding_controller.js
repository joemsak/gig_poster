import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geocoding"
export default class extends Controller {
  static values = {
    postalCode: String
  }

  connect() {
    const csrfToken = document.querySelector("meta[name='csrf-token']").content

    if (!this.postalCodeValue && navigator.geolocation && navigator.geolocation.getCurrentPosition)
      navigator.geolocation.getCurrentPosition(({ coords }) => fetch(
        "/geocoding",
        {
          method: "post",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": csrfToken
          },
          body: JSON.stringify({ lat: coords.latitude, lng: coords.longitude })
        }
      ))
        .then(resp => { if (!resp.ok) { throw resp; }; return resp.json() })
        .then(json => this.postalCodeValue = resp.postal_code)
        .catch(error => { console.error("error", error) })
  }
}
