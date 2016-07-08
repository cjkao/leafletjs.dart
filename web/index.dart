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
  var clickfun = allowInterop((L.Event evt) {
    print('${evt.type}  ${evt.layerPoint.x} ');
    print(evt.containerPoint.x);
  });
  var clickfun2 = (L.Event evt) {
    print('${evt.type}  ${evt.layerPoint.x} ');
    print(evt.containerPoint.x);
  };
  var bound = new L.Bounds(new L.Point(1, 1), new L.Point(100, 100));
  var bound2 = new L.Bounds(new L.Point(0, 1), new L.Point(100, 100));
  var latlngx = new L.LatLng([1, 2, 3]);
  var latLngBnd = new L.LatLngBounds(latlngx);

  var p = L.LonLat.project(latlngx);
  var unP = L.LonLat.unproject(p);
  var pbound = L.LonLat.bounds;
  var pbound2 = L.LonLat.bounds;
  print('${p} ${unP} ${pbound.getSize().x}');
  L.SphericalMercator.R = 3;
  var sp = L.SphericalMercator.project(latlngx);

  //L.CRS crs = new L.CRS();
  //print('${crs.infinite}');

  ///  var projLat=p.project(latlngx);
//  print("project $projLat")
//  latLngBnd.containsBounds(new L.LatLngBounds(latlngx));
  print("latlng ${latlngx is L.LatLng}");
  print("latlng ${latlngx.lat}");
  print("latlng ${latlngx is L.LatLng}");
  var p1 = new L.Point(2, 3);
  print(bound.contains(p1));
  print(bound.contains(bound2));
//  print(bound.containsBounds(bound2));
  _map.on('click', clickfun);
//  _map.off('click',clickfun);
//  _map.once('click',clickfun);
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
