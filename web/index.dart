//import 'dart:math' hide Rectangle;
import 'dart:html' hide Rectangle;
import 'dart:async';
import 'package:js/js.dart';
import 'package:leafletjs/leafletjs.dart' as L;

main() async {
  _initMap();
}

_initMap() {
  var accessToken = 'pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw';

  var _map = new L.Map("map", new L.MapOptions(center: new L.LatLng(60.222296, 24.929713), zoom: 11));
  var clickfun= allowInterop((L.Event evt) {
    print(evt.layerPoint.x);
    print(evt.containerPoint.x);
  });
  _map.on('click',clickfun);
  _map.off('click',clickfun);
  _map.once('click',clickfun);
  new L.TileLayer(
          'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
          new L.TileLayerOptions(
              attribution:
                  'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
              maxZoom: 18,
              id: 'mapbox.streets',
              accessToken: accessToken))
      .addTo(_map);
}
