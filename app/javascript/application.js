// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

(() => {
  document.addEventListener("turbo:load", () => {
    const openMenu = document.querySelector("#open_menu")
    const closeMenu = document.querySelector("#close_menu")
    const menu = document.querySelector("#menu")

    openMenu.addEventListener("click", () => menu.classList.remove("hidden"))
    closeMenu.addEventListener("click", () => menu.classList.add("hidden"))
  })
})()
