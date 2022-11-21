// # app/assets/javascripts/buildings.js

$(function() {

   if ($("select#customer").val() == "") {
    $("select#building option").remove();
    var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
    $(row).appendTo("select#building");
   }
   $("select#customer").change(function() {
    var id_value_string = $(this).val();
    if (id_value_string == "") {
     $("select#building option").remove();
     var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
     $(row).appendTo("select#building");
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
       $("select#building option").remove();
       //put in a empty default line
       var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
       $(row).appendTo("select#building");
       // Fill building select
       $.each(data, function(i, j) {
        row = "<option value=\"" + j.id + "\">" + j.FullNameOfBuildingAdmin + "</option>";
        $(row).appendTo("select#building");
       });
      }
     });
    }
   });

  });