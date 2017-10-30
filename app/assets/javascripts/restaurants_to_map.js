$( document ).ready(function() {
    var coordinates = $("#coordinates-div").data().coordinates;
    console.log( coordinates );

    var mymap = L.map('map').setView([-34.5781989, -58.4381492], 13);

    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=sk.eyJ1Ijoid2hlbnNicnVuY2giLCJhIjoiY2o4ZHM5dGk0MHNnYzMzb2syODJoeHRhcCJ9.90qVchOiN_g4dgUDBensMA', {
         attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
         maxZoom: 18,
         id: 'mapbox.streets',
         accessToken: 'sk.eyJ1Ijoid2hlbnNicnVuY2giLCJhIjoiY2o4ZHM5dGk0MHNnYzMzb2syODJoeHRhcCJ9.90qVchOiN_g4dgUDBensMA'
    }).addTo(mymap);

    for (i = 0; i < coordinates.length; i++) {
      console.log(coordinates[i].name)
      if (coordinates[i].latitude && coordinates[i].longitude)
        var marker = L.marker(
          [coordinates[i].latitude, coordinates[i].longitude],
          {title: coordinates[i].name}
        )
        var a = document.createElement('a');
        restaurant_path = '/restaurants/' + coordinates[i].id;
        a.setAttribute('href', restaurant_path);
        a.innerHTML = coordinates[i].name;

        marker.addTo(mymap);
        marker.bindPopup(
          '<b>' +
          a.outerHTML +
          '</b><br>' +
          coordinates[i].rating +
          '<br>' +
          coordinates[i].review_count +
          '<br>' +
          coordinates[i].address +
          '<br>' +
          coordinates[i].price
        );
    }
});
