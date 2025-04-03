// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


(() => {
  document.addEventListener("turbo:load", () => {
    const menuToggle = document.querySelector("#menu_toggle")

    menuToggle.addEventListener("click", e => {
      const menu = document.querySelector("#menu")
      menu.classList.toggle("hidden")
    })
  })
})()
