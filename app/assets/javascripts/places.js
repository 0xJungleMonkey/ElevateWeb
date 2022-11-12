
function initMap() {
    var lat=43.4732;
    // 35.1774;
    var lng=-72.4964;
    // -97.4118;

    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
        center: myCoords,
        zoom: 4,
        mapTypeId: google.maps.MapTypeId.ROADMAP

    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    let locations = [];
    document.querySelectorAll("li.address-list-item").forEach(address => {
            let position = [
                
                address.getAttribute("data-latitude"),
                address.getAttribute("data-longitude"),
                address.getAttribute("data-location1"),
                address.getAttribute("data-location2"),
                address.getAttribute("data-location3"),
                address.getAttribute("data-location4"),
                // address.getAttribute("data-location5"),
                address.getAttribute("data-client"),
                address.getAttribute("data-tec"),
                address.getAttribute("data-batteries"),
                address.getAttribute("data-columns"),
                address.getAttribute("data-elevators"),
                address.getAttribute("data-buildingfloors")
                
            ]
            locations.push(position)
    });
    

    var infowindow =  new google.maps.InfoWindow({});
    var marker, count;
    for (count = 0; count < locations.length; count++) {
        marker = new google.maps.Marker({
            position: new google.maps.LatLng(locations[count][0], locations[count][1]),
            map: map,
            title: locations[count][2] + locations[count][3]+ locations[count][4]+locations[count][5],
        
        });
    google.maps.event.addListener(marker, 'click', (function (marker, count) {
          return function () {
            infowindow.setContent("<p>" +"Building Location: " +locations[count][2]+", "+
             locations[count][3]+", "+ locations[count][4]+", "+locations[count][5]+
             "<br /> Company Name: "+locations[count][6]+
             "<br /> Full name of the tech: "+locations[count][7]+
             "<br /> No.of Batteries: " +locations[count][8] +
              "<br /> No.of Columns: " + locations[count][9]+
               "<br /> No.of Elevators: " + locations[count][10] +
                "<br /> No.of Floors: " + locations[count][11]+"</p>");
            infowindow.open(map, marker);
          }
        })(marker, count));
      }

}
