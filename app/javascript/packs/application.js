import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import * as bootstrap from 'bootstrap'
import "@popperjs/core"
import "../stylesheets/application"
import "@fortawesome/fontawesome-free/css/all"
import "./spinner"
import "./clean-blog.min"

var jQuery = require("jquery");
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

document.addEventListener("DOMContentLoaded", function(event) {
  var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })

  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
});

Rails.start()
ActiveStorage.start()
