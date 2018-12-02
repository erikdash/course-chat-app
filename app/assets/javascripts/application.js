// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require rails-ujs
//= require activestorage

/**
 * Display the modal on button click.
 */
var addRoom = document.getElementById('add-room');
var addRoomModal = document.getElementById('add-room-modal');
var closeRoomModal = document.getElementsByClassName("close")[0];

addRoom.onclick = function() {
  addRoomModal.style.display = "block";
}

closeRoomModal.onclick = function() {
  addRoomModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == addRoomModal) {
      addRoomModal.style.display = "none";
  }
} 

/**
 * Add and remove the selected class from the left radio buttons.
 */
$(document).ready(function () {
  $('input').click(function () {
      $('input:not(:checked)').parent().removeClass("selected");
      $('input:checked').parent().addClass("selected");
  });
});


