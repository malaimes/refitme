$(window).load(function() {
  loadScript();
});
function initialize() {
  var mapOptions = {
    scrollwheel: false,
    zoom: 11,
    center: new google.maps.LatLng(50.447056,30.525361)
  }
  var map = new google.maps.Map(document.getElementById('map-canvas'),
                                mapOptions);

  setMarkers(map, beaches);
}

var beaches = [
  ['Akademmistechko', 50.464936,30.355272],
  ['Nyvky', 50.458631,30.403915],
  ['PolitekhnichnyiInstytut', 50.450953,30.465144],
  ['Teatralna', 50.444851,30.516073],
  ['Khreshchatyk', 50.447056,30.525361],
  ['Arsenalna', 50.443017,30.547733],
  ['Darnytsia', 50.455961,30.612845],
  ['Minska', 50.512242,30.498551],
  ['Obolon', 50.501466,30.498228],
  ['KontraktovaPloshcha', 50.46605,30.514996],
  ['MaidanNezalezhnosti', 50.447973,30.525273],
  ['PloshchaLvaTolstoho', 50.440075,30.518021],
  ['Olimpiiska', 50.431281,30.516903],
  ['Demiivska', 50.404788,30.516868],
  ['Vasylkivska', 50.393251,30.48767],
  ['Dorohozhychi', 50.473119,30.452247],
  ['ZolotiVorota', 50.446159,30.515426],
  ['PalatsSportu', 50.437595,30.520567],
  ['Pecherska', 50.426553,30.54012],
  ['Osokorky', 50.395248,30.616231],
  ['Kharkivska', 50.40073,30.652474],
  ['Soloma', 50.4206575,30.4565102],
  ['Voskresenka', 50.4802008,30.5992413],
  ['Troya', 50.5162336,30.6022882]
];

function setMarkers(map, locations) {
  for (var i = 0; i < locations.length; i++) {
    var beach = locations[i];
    var myLatLng = new google.maps.LatLng(beach[1], beach[2]);
    var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,

    });
  }
}
function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
    '&key=AIzaSyAW3UntOyhPmmngpKjjfM7ohm-8LLXRXI4'+
    '&libraries=drawing'+
    '&callback=initialize';
  document.body.appendChild(script);
}
