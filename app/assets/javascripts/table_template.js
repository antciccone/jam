var table = function(data){
  var tableHTML = "";
  tableHTML += '<tr>';
  tableHTML +=      '<td>';
  tableHTML +=  '<div class="text-center date-body">';
  tableHTML +=  '<label for="" class="date-title">'+ data.formatted_datetime + '</label>';
  // tableHTML +=  '<div class="date-content">';
  // tableHTML +=     '<p class="dia">' + data.formatted_datetime + '</p>'
  // tableHTML +=          '<hr class="nomargin"/>';
  // tableHTML +=                  '<p class="nomargin">';
  // tableHTML +=                      '<strong>' + data.formatted_datetime + '</strong>';
  // tableHTML +=                  '</p>';
  // tableHTML +=                   '<p class="nomargin">';
  // tableHTML +=                      '<strong>' + data.formatted_datetime  + '</strong>';
  // tableHTML +=                  '</p>';
  // tableHTML +=              '</div>';
  tableHTML +=          '</div>';
  tableHTML +=      '</td>';
  tableHTML +=      '<td>' + data.artists + '</td>';
  tableHTML += '<td>' + data.venue.name + '</td>';
  tableHTML +=      '<td>' + data.venue.city + '</td>';
  tableHTML +=      '<td>' + '<A HREF="#codeword">' + '<span class="glyphicon glyphicon-envelope" aria-hidden="true">' + '</A>' + '</span>' + '</td>';
  tableHTML +=      '<td class="text-center">';
  tableHTML +=          '<a class="btn btn-info btn-xs" href="link">' + '<span class="glyphicon glyphicon-edit">' + '</span>' + 'Ticket Link</a>';
  tableHTML +=     '</td>';
  tableHTML +=     '<td>' + "hello" + '</td>';
  tableHTML +=   '</tr>';
    return tableHTML;
}
