// # app/assets/javascripts/buildings.js

$(function() {

    if ($("select#battery_id").val() == "") {
     $("select#column_id option").remove();
     var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
     $(row).appendTo("select#column_id");
    }
    $("select#battery_id").change(function() {
     var id_value_string = $(this).val();
     if (id_value_string == "") {
      $("select#column_id option").remove();
      var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
      $(row).appendTo("select#column_id");
     } else {
      // Send the request and update building dropdown
      $.ajax({
       dataType: "json",
       cache: false,
       url: '/get_columns_by_battery_id/' + id_value_string,
       timeout: 5000,
       error: function(XMLHttpRequest, errorTextStatus, error) {
        alert("Failed to submit : " + errorTextStatus + " ;" + error);
       },
       success: function(data) {
        // Clear all options from building select
        $("select#column_id option").remove();
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
        $(row).appendTo("select#column_id");
        // Fill building select
        $.each(data, function(i, j) {
         row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
         $(row).appendTo("select#column_id");
        });
       }
      });
     }
    });
 
   });