// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require_tree .


var onGetSuccess = function(data){
  alert("it worked")
  }
  var onFail = function(error){
    console.error(error);
  }

var getAllConcerts = function(){
  var artist = $('input[name="q"]').val();
  debugger;
  var path = "http://api.bandsintown.com/artists/" + artist + "/events?api_version=2.0&app_id=jam&format=json"
  return $.ajax({
    method: 'GET',
    url: path,
    data: { 'Authorization' : 'Bearer #{user.token}' }

  })
  .done(onGetSuccess)
  .fail(onFail);
  };


$(document).ready(function(){
  setTimeout(function(){
  $('.alert-dismissible').fadeOut();
    },
   2000);

   $('.navbar-form').on('submit', getAllConcerts);

   $('ajax form').on('submit', function(event){
    event.preventDefault();
  });

 });
