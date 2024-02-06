// document.addEventListener('turbolinks:load', function() {
//     const mypageBtnContainer = document.getElementById('mypageBtnContainer');
//     const mypageDropdown = document.getElementById('mypageDropdown');
  
//     if (mypageBtnContainer) {
//       mypageBtnContainer.addEventListener('click', function() {
//         if (mypageDropdown.style.display === 'block') {
//           mypageDropdown.style.display = 'none';
//         } else {
//           mypageDropdown.style.display = 'block';
//         }
//       });
  
//       mypageBtnContainer.addEventListener('mouseenter', function() {
//         mypageDropdown.style.display = 'block';
//       });
  
//       mypageBtnContainer.addEventListener('mouseleave', function() {
//         mypageDropdown.style.display = 'none';
//       });
//     }
//   });
// console.log("動いたscriptjs")
// document.addEventListener("DOMContentLoaded", function() {
//   var dropdownToggleLink = document.querySelector(".dropdown-toggle");
//   if (dropdownToggleLink) {
//     dropdownToggleLink.addEventListener("click", function(e) {
//       e.preventDefault();
//       var dropdownMenu = document.querySelector(".dropdown-menu");
//       dropdownMenu.classList.toggle("show");
//       // 他のドロップダウンメニューが開いている場合は閉じる
//       var otherDropdownMenus = document.querySelectorAll(".dropdown-menu.show");
//       Array.prototype.forEach.call(otherDropdownMenus, function(menu) {
//         if (menu !== dropdownMenu) {
//           menu.classList.remove("show");
//         }
//       });
//     });
//   }
// });
document.addEventListener("DOMContentLoaded", function() {
  var dropdownToggleLink = document.querySelector(".dropdown-toggle");
  if (dropdownToggleLink) {
    dropdownToggleLink.addEventListener("click", function(e) {
      e.preventDefault();
      var dropdownMenu = document.querySelector(".dropdown-menu");
      if (dropdownMenu.classList.contains("show")) {
        dropdownMenu.classList.remove("show"); // メニューが開いている場合は閉じる
      } else {
        dropdownMenu.classList.add("show"); // メニューが閉じている場合は開く
      }
    });
  }
});