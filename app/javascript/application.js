import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "./channels"
import "./add_jquery"
import * as bootstrap from 'bootstrap'
import "@popperjs/core"
import "./stylesheets/application.scss"
import "./spinner"
import "./clean-blog.min"
import * as lightbox from 'lightbox2'


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
