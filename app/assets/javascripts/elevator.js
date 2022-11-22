// # app/assets/javascripts/elevators.js

$(function() {

    if ($("select#column_id").val() == "") {
     $("select#elevator_id option").remove();
     var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
     $(row).appendTo("select#elevator_id");
    }
    $("select#column_id").change(function() {
     var id_value_string = $(this).val();
     if (id_value_string == "") {
      $("select#elevator_id option").remove();
      var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
      $(row).appendTo("select#elevator_id");
     } else {
      // Send the request and update building dropdown
      $.ajax({
       dataType: "json",
       cache: false,
       url: '/get_elevators_by_column_id/' + id_value_string,
       timeout: 5000,
       error: function(XMLHttpRequest, errorTextStatus, error) {
        alert("Failed to submit : " + errorTextStatus + " ;" + error);
       },
       success: function(data) {
        // Clear all options from building select
        $("select#elevator_id option").remove();
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
        $(row).appendTo("select#elevator_id");
        // Fill building select
        $.each(data, function(i, j) {
         row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
         $(row).appendTo("select#elevator_id");
        });
       }
      });
     }
    });
 
   });