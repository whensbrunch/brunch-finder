var mymap = L.map('mapid').setView([-34.5781989, -58.4381492], 13);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=sk.eyJ1Ijoid2hlbnNicnVuY2giLCJhIjoiY2o4ZHM5dGk0MHNnYzMzb2syODJoeHRhcCJ9.90qVchOiN_g4dgUDBensMA', {
     attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
     maxZoom: 18,
     id: 'mapbox.streets',
     accessToken: 'sk.eyJ1Ijoid2hlbnNicnVuY2giLCJhIjoiY2o4ZHM5dGk0MHNnYzMzb2syODJoeHRhcCJ9.90qVchOiN_g4dgUDBensMA'
}).addTo(mymap);

var marker = L.marker([-34.578, -58.438]).addTo(mymap);
marker.bindPopup("<b>Hello world!</b><br>I am a popup.");
 // var map = L.map('map');
 // map.setView([51.52238797921441, -0.08366235665359283], 18);
 // L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=sk.eyJ1Ijoid2hlbnNicnVuY2giLCJhIjoiY2o4ZHM5dGk0MHNnYzMzb2syODJoeHRhcCJ9.90qVchOiN_g4dgUDBensMA', {
 //           attribution: 'My attribution statement',
 //           maxZoom: 18,
 // }).addTo(map);
 //
 // jQuery ->
 //   alert $('#coordinates').data("coord")
 //
 // function shifty(lat) {
 //   return lat + 1
 // }
