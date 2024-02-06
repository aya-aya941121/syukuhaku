// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("../script.js")
import 'bootstrap/dist/js/bootstrap'
// console.log("動いた")

// document.addEventListener("DOMContentLoaded", function() {
//     var dropdownToggleLink = document.querySelector(".dropdown-toggle");
//     if (dropdownToggleLink) {
//       dropdownToggleLink.addEventListener("click", function(e) {
//         e.preventDefault();
//         var dropdownMenu = document.querySelector(".dropdown-menu");
//         if (dropdownMenu.classList.contains("show")) {
//           dropdownMenu.classList.remove("show"); // メニューが開いている場合は閉じる
//         } else {
//           dropdownMenu.classList.add("show"); // メニューが閉じている場合は開く
//         }
//       });
//     }
//   });

// document.addEventListener("DOMContentLoaded", function() {
//     var dropdownToggleLink = document.querySelector(".dropdown-toggle");
//     if (dropdownToggleLink) {
//       dropdownToggleLink.addEventListener("click", function(e) {
//         e.preventDefault();
//         var dropdownMenu = document.querySelector(".dropdown-menu");
//         dropdownMenu.classList.toggle("show");
//       });
//     }
//   });

Rails.start()
Turbolinks.start()
ActiveStorage.start()

