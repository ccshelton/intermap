$( document ).ready(function() {
  $("#cda_count_form").submit( function ( event ){
    event.preventDefault()
    var value = $("#cda_count_form").find(":selected").text()
    $.ajax({
      type: 'POST',
      url: "/admin/render_settings",
      data: {
        "value": value
      },
    }).done(function( response ) {
      $("#cda_count_form").replaceWith(response)
      })
  });

});
