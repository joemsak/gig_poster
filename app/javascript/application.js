// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

(() => {
  document.addEventListener("turbo:load", () => {
    const reverseGeocodePath = "/geocoding"
    const lsPostalCodeKey = "_bh_postal_code"
    const postalCode = localStorage.getItem(lsPostalCodeKey)

    if (!postalCode && "geolocation" in navigator)
      navigator.geolocation.getCurrentPosition(({ coords }) => {
        fetch(`${reverseGeocodePath}?lat=${coords.latitude}&lng=${coords.longitude}`)
          .then(resp => resp.json())
          .then(json => localStorage.setItem(lsPostalCodeKey, json.postalCodes[0].postalCode))
      })
  })
})()
