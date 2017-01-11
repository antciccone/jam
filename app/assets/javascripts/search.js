var onGetSuccess = function(data){
  $('.date-title').html('');
  for (var i = 0; i < data.length; i++) {
    var tableHTML = table(data[i]);
    $('table.table-striped.custab').append(tableHTML);
    }
  }
  var onFail = function(error){
    console.error(error);
  }

var getAllConcerts = function(){
  var artist = $('input[name="q"]').val();
  var path = "https://api.bandsintown.com/artists/" + artist + "/events?api_version=2.0&app_id=jam&format=json"
  return $.ajax({
    method: 'GET',
    url: path,
    dataType: "jsonp"

  })
  .then(onGetSuccess)
  .fail(onFail);
  };




$(document).ready(function(){
  setTimeout(function(){
  $('.alert-dismissible').fadeOut();
    },
   2000);

   $('.navbar-form').on('submit', getAllConcerts);

   $('form.navbar-form').on('submit', function(event){
    event.preventDefault();
  });


 });
