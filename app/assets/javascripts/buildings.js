// # app/assets/javascripts/buildings.js

$(function() {

   if ($("select#customer_id").val() == "") {
    $("select#building_id option").remove();
    var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
    $(row).appendTo("select#building_id");
   }
   $("select#customer_id").change(function() {
    var id_value_string = $(this).val();
    if (id_value_string == "") {
     $("select#building_id option").remove();
     var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
     $(row).appendTo("select#building_id");
    } else {
     // Send the request and update building dropdown
     $.ajax({
      dataType: "json",
      cache: false,
      url: '/get_buildings_by_customer_id/' + id_value_string,
      timeout: 5000,
      error: function(XMLHttpRequest, errorTextStatus, error) {
       alert("Failed to submit : " + errorTextStatus + " ;" + error);
      },
      success: function(data) {
       // Clear all options from building select
       $("select#building_id option").remove();
       //put in a empty default line
       var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
       $(row).appendTo("select#building_id");
       // Fill building select
       $.each(data, function(i, j) {
        row = "<option value=\"" + j.id + "\">" + j.FullNameOfBuildingAdmin + "</option>";
        $(row).appendTo("select#building_id");
       });
      }
     });
    }
   });

  });