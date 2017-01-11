var table = function(data){
  var tableHTML = "";
  tableHTML += '<tr>';
  tableHTML +=      '<td>';
  tableHTML +=  '<div class="text-center date-body">';
  tableHTML +=  '<label for="" class="date-title">'+ data.formatted_datetime.split(" ")[1] + " " + data.formatted_datetime.split(" ")[3]+ '</label>';
  tableHTML +=  '<div class="date-content">';
  tableHTML +=     '<p class="dia">' + data.formatted_datetime.split(" ")[2] + '</p>';
  tableHTML +=          '<hr class="nomargin"/>';
  tableHTML +=                  '<p class="nomargin">';
  tableHTML +=                      '<strong>' + data.formatted_datetime.split(" ")[0] + '</strong>';
  tableHTML +=                  '</p>';
  tableHTML +=                   '<p class="nomargin">';
  tableHTML +=                      '<strong>' + data.formatted_datetime.split(" ")[5]  + '</strong>';
  tableHTML +=                  '</p>';
  tableHTML +=              '</div>';
  tableHTML +=          '</div>';
  tableHTML +=      '</td>';
  tableHTML +=      '<td>' + data.artists[0].name + '</td>';
  tableHTML += '<td>' + data.venue.name + '</td>';
  tableHTML +=      '<td>' + data.venue.city + '</td>';
  tableHTML +=      '<td>' + '<A HREF="#codeword">' + '<span class="glyphicon glyphicon-envelope" aria-hidden="true">' + '</A>' + '</span>' + '</td>';
  tableHTML +=      '<td class="text-center">';
  tableHTML +=          '<a class="btn btn-info btn-xs" href=' + data.ticket_url + '>' + '<span class="glyphicon glyphicon-edit">' + '</span>' + 'Ticket Link</a>';
  tableHTML +=     '</td>';
  tableHTML +=     '<td>' +  '<img class="concerts-img" src=' + data.artists[0].image_url + '>' + '</td>';
  tableHTML +=   '</tr>';
    return tableHTML;
}
