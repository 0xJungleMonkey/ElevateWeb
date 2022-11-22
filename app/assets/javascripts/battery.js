// # app/assets/javascripts/buildings.js

$(function() {

    if ($("select#building_id").val() == "") {
     $("select#battery_id option").remove();
     var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
     $(row).appendTo("select#battery_id");
    }
    $("select#building_id").change(function() {
     var id_value_string = $(this).val();
     if (id_value_string == "") {
      $("select#battery_id option").remove();
      var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
      $(row).appendTo("select#battery_id");
     } else {
      // Send the request and update building dropdown
      $.ajax({
       dataType: "json",
       cache: false,
       url: '/get_batteries_by_building_id/' + id_value_string,
       timeout: 5000,
       error: function(XMLHttpRequest, errorTextStatus, error) {
        alert("Failed to submit : " + errorTextStatus + " ;" + error);
       },
       success: function(data) {
        // Clear all options from building select
        $("select#battery_id option").remove();
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
        $(row).appendTo("select#battery_id");
        // Fill building select
        $.each(data, function(i, j) {
         row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
         $(row).appendTo("select#battery_id");
        });
       }
      });
     }
    });
 
   });