// Entry point for the build script in your package.json
//= require jquery
//= require_tree .
//= require aos
import "@hotwired/turbo-rails"
import "./controllers"
import "./custom/custom"

document.addEventListener("turbolinks:load", function() {
  AOS.init();
});
