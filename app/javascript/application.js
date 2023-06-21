// Entry point for the build script in your package.json
//= require_tree .
//= require jquery
//= require aos
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener("turbolinks:load", function() {
  AOS.init();
});

