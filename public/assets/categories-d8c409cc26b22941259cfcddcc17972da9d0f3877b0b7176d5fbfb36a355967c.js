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

/**
 * Data for the markers consisting of a name, a LatLng and a zIndex for
 * the order in which these markers should display on top of each
 * other.
 */
var beaches = [
/**
  ['Akademmistechko', 50.464936,30.355272, 1],
  ['Zhytomyrska', 50.456135,30.365286, 2],
  ['Sviatoshyn', 50.457771,30.390585, 3],
  ['Nyvky', 50.458631,30.403915, 4],
  ['Beresteiska', 50.45927,30.419014, 5],
  ['Shuliavska', 50.454489,30.447239],
  ['PolitekhnichnyiInstytut', 50.450953,30.465144],
  ['Vokzalna', 50.44139,30.489041],
  ['Universytet', 50.442925,30.503718],
  ['Teatralna', 50.444851,30.516073],
  ['Khreshchatyk', 50.447056,30.525361],
  ['Arsenalna', 50.443017,30.547733],
  ['Dnipro', 50.441216,30.559315],
  ['Hidropark', 50.445957,30.576857],
  ['Livoberezhna', 50.451865,30.598076],
  ['Darnytsia', 50.455961,30.612845],
  ['Chernihivska', 50.459834,30.630332],
  ['Lisova', 50.464682,30.645571],

  ['HeroivDnipra', 50.522728,30.498913],
  ['Minska', 50.512242,30.498551],
  ['Obolon', 50.501466,30.498228],
  ['Petrivka', 50.486078,30.497851],
  ['TarasaShevchenka', 50.474155,30.503491],
  ['KontraktovaPloshcha', 50.46605,30.514996],
  ['PoshtovaPloshcha', 50.459269,30.524412],
  ['MaidanNezalezhnosti', 50.447973,30.525273],
  ['PloshchaLvaTolstoho', 50.440075,30.518021],
  ['Olimpiiska', 50.431281,30.516903],
  ['PalatsUkrayina', 50.421186,30.520611],
  ['Lybidska', 50.414438,30.524882],
  ['Demiivska', 50.404788,30.516868],
  ['Holosiivska', 50.39746,30.508361],
  ['Vasylkivska', 50.393251,30.48767],
  ['VystavkovyiTsentr', 50.382412,30.477655],
  ['Ipodrom', 50.376674,30.468987],
  ['Teremky', 50.367171,30.454413],

  ['Syrets', 50.476393,30.430866],
  ['Dorohozhychi', 50.473119,30.452247],
  ['Lukianivska', 50.461179,30.483671],
  ['ZolotiVorota', 50.446159,30.515426],
  ['PalatsSportu', 50.437595,30.520567],
  ['Klovska', 50.435902,30.533423],
  ['Pecherska', 50.426553,30.54012],
  ['DruzhbyNarodiv', 50.416841,30.546918],
  ['Vydubychi', 50.402102,30.56016],
  ['Slavutych', 50.394264,30.604859],
  ['Osokorky', 50.395248,30.616231],
  ['Pozniaky', 50.397944,30.634579],
  ['Kharkivska', 50.40073,30.652474],
  ['Vyrlytsia', 50.40312,30.666891],
  ['Boryspilska', 50.403375,30.684195],
  ['ChervonyKhutir', 50.4082095,30.6921773],
 */
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
  ['Troya', 50.5162336,30.6022882],



];

function setMarkers(map, locations) {
  // Add markers to the map

  // Marker sizes are expressed as a Size of X,Y
  // where the origin of the image (0,0) is located
  // in the top left of the image.

  // Origins, anchor positions and coordinates of the marker
  // increase in the X direction to the right and in
  // the Y direction down.
  
  // Shapes define the clickable region of the icon.
  // The type defines an HTML &lt;area&gt; element 'poly' which
  // traces out a polygon as a series of X,Y points. The final
  // coordinate closes the poly by connecting to the first
  // coordinate.

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
  //'https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyAh0n8lkq95shhyeHENIs0_ig_7O_7XLds&sensor=false&libraries=drawing'
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
    '&key=AIzaSyAW3UntOyhPmmngpKjjfM7ohm-8LLXRXI4'+
    '&libraries=drawing'+
    '&callback=initialize';
  document.body.appendChild(script);
}

;
$(window).scroll(function(){

  var wScroll = $(this).scrollTop();

  $('.logo').css({
    'transform' : 'translate(0px, '+ wScroll /5 +'%)'
  });

  $('.back-bird').css({
    'transform' : 'translate(0px, '+ wScroll /4 +'%)'
  });

  $('.fore-bird').css({
    'transform' : 'translate(0px, -'+ wScroll /50 +'%)'
  });

  if(wScroll > $('.clothes-pics').offset().top - ($(window).height() / 1.2)) {

      $('.clothes-pics li').each(function(i){

        setTimeout(function(){
          $('.clothes-pics li').eq(i).addClass('is-showing');
          }, 150 * (i+1));
      });
   }

   if(wScroll > $('.clothes-pics').offset().top - ($(window).height() * 10)) {

      $('.clothes-pics li').each(function(i){

        setTimeout(function(){
          $('.clothes-pics li').eq(i).addClass('is-showing');
          }, 150 * (i+1));
      });
   }

});
