// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

(() => {
  document.addEventListener("turbo:load", () => {
    const reverseGeocodePath = "http://api.geonames.org/findNearbyPostalCodesJSON"
    const lsPostalCodeKey = "_bh_postal_code"
    const postalCode = localStorage.getItem(lsPostalCodeKey)

    if ("geolocation" in navigator && !postalCode)
      navigator.geolocation.getCurrentPosition(({ coords }) => {
        fetch(`${reverseGeocodePath}?lat=${coords.latitude}&lng=${coords.longitude}&username=joemsak`)
          .then(resp => resp.json())
          .then(json => localStorage.setItem(lsPostalCodeKey, json.postalCodes[0].postalCode))
      })
  })
})()
