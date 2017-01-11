var table = function(data){
  debugger;
  var tableHTML = "";
  tableHTML += '<tr>';
  tableHTML +=      '<td>';
  tableHTML +=  '<div class="text-center date-body">';
  tableHTML +=  '<label for="" class="date-title">'+ data.formatted_datetime + '</label>';
  tableHTML +=  '<div class="date-content">';
  tableHTML +=     '<p class="dia">' + data.formatted_datetime + '</p>'
  tableHTML +=          '<hr class="nomargin"/>';
  tableHTML +=                  '<p class="nomargin">';
  tableHTML +=                      '<strong>' + data.formatted_datetime + '</strong>';
  tableHTML +=                  '</p>';
  tableHTML +=                   '<p class="nomargin">';
  tableHTML +=                      '<strong>' + data.formatted_datetime  + '</strong>';
  tableHTML +=                  '</p>'
                </div>
            </div>
        </td>
        <td>Artist name </td>
        <td>Arists venue </td>
        <td>city</td>
        <td><A HREF="#codeword"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></A></span> </td>
        <td class="text-center">
            <a class='btn btn-info btn-xs' href="<%= artist.ticket_link %>">
                <span class="glyphicon glyphicon-edit"></span>
                Ticket Link</a>
        </td>
        <td> image </td>
    </tr>
    return tableHTML;
}
