@JS()
library mymain;

//import 'dart:math' hide Rectangle;
import 'dart:async';
import 'dart:js';
import 'dart:convert';
import 'package:js/js.dart';
import 'package:leafletjs/leafletjs.control.dart' as ctrl;
import 'package:leafletjs/leafletjs.dart' as L;
import 'package:leafletjs/leafletjs.layer.dart';
//import 'package:leafletjs/src/geo/crs/crs.dart' as crs;
import 'package:leafletjs/leafletjs.geo.dart' as geo;
import 'package:leafletjs/leafletjs.util.dart';
//import 'dyn.dart';

@JS('JSON.parse')
external JSONparse(_);

@anonymous
@JS()
class LiteralLayers {
  external factory LiteralLayers({city, street});
}

@JS("L.CRS.Simple200")
external geo.CrsSimple get Simple200;

main() async {
  _initMap();
}

_initMap() {
  var accessToken = '';
  var sCRS = Simple200;

  var _map = new L.Map(
      "map",
      new L.MapOptions(
          center: [0, 0],
          maxBounds: new L.LatLngBounds([
            [-128, -128],
            [128, 128]
          ]),
          crs: sCRS,
          wheelDebounceTime: 90,
          minZoom: 1,
          zoom: 1,
          zoomControl: true));
  print(_map.zoomControl);
  context['mmm'] = _map;
  var marker = testMarker(_map);
  testGeo(marker);
  testPolygon(_map);
  var clickfun = allowInterop((L.Event evt) {
    print('${evt.type}  ${evt.latlng.lng} ${evt.latlng.lat}');
    print(evt.containerPoint.x);
  });
  var clickfun2 = (L.Event evt) {
    print(evt.containerPoint.x);
  };
  var bound = new L.Bounds(new L.Point(1, 1), new L.Point(100, 100));
  var bound2 = new L.Bounds(new L.Point(0, 1), new L.Point(100, 100));
  var latlngx = new L.LatLng([1, 2, 3]);
  var latLngBnd = new L.LatLngBounds(latlngx);

  print(latLngBnd);
  var p = L.LonLat.project(latlngx);
  var unP = L.LonLat.unproject(p);
  var pbound = L.LonLat.bounds;
  var pbound2 = L.LonLat.bounds;
  print('${p} ${unP} ${pbound.getSize().x}');
  var sp = L.SphericalMercator.project(latlngx);

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
  var tileLayer = new TileLayer('../tile/small-{z}-{x}-{y}.png',
          new TileLayerOptions(maxZoom: 3, accessToken: accessToken, noWrap: true, errorTileUrl: 'empty.png'))
      .addTo(_map);
  var pop = new Popup();
  pop.setContent('htmlContent').setLatLng(new L.LatLng(10, 30)).addTo(_map);
  var myIcon = new DivIcon(new DivIconOptions(className: 'my-div-icon'));
//  var defIcon = getDefaultIcon();
  var opt = myIcon.options as DivIconOptions;
  print(opt.className);
//  var defIconOpt = defIcon.options as IconOptions;
//  print(defIconOpt);
  new Marker(new L.LatLng(50.505, 30.57), new MarkerOptions(icon: myIcon)).addTo(_map);

//  var jobj = new DynamicSource();
//  var items = new Dynamic<Layer>();
  var items = new Dynamic();

  items['city'] = tileLayer;
  items['book'] = tileLayer;

  new ctrl.Layers(items.source)..addTo(_map);
  new ctrl.Scale().addTo(_map);
}

testLayer() {}

Marker testMarker(L.Map _map) {
  var mopt = new MarkerOptions();
  mopt.draggable = true;
  var marker = new Marker(new L.LatLng([0, 0]), new MarkerOptions()..draggable = true)
    ..bindPopup('0,0')
    ..addTo(_map);
  new Marker([100, 100])
    ..bindPopup('100,100')
    ..addTo(_map);
  new Marker([-100, -100])
    ..bindPopup('-100,-100')
    ..addTo(_map);
  new Marker([-100, 0])
    ..bindPopup('-100,0')
    ..addTo(_map);
  var cm = new CircleMarker(new L.LatLng(-10, 10));
  cm.addTo(_map);
  new Future.delayed(new Duration(seconds: 120), () => marker.remove());
  return marker;
}

testGeo(Marker marker) {
  var mGeoJSON = marker.toGeoJSON();
  print(mGeoJSON);
}

testPolygon(L.Map _map) {
  var polygon = new Polygon(
          [new L.LatLng(-100, -100), new L.LatLng(100, 100), new L.LatLng(100, 0), new L.LatLng(50, 0)],
          new PolylineOptions()..color = 'red')
      .addTo(_map);
  var lenP = _map.project(new L.LatLng(0, 100), 0);
  var circle = new Circle([0, 0], new CircleMarkerOptions(fill: false))..setRadius(lenP.y);
  circle.addTo(_map);
  new Rectangle(getBounds(0, 0, 20, 30))..addTo(_map);
  polygon.bindPopup('hi');
}

testCRS() {
  var crsSimple = geo.Simple;
  print(crsSimple.infinite);
  print('crs scale ${crsSimple.scale(1)}');
}

L.LatLngBounds getBounds(num cx, num cy, num width, num height) {
  var hw = width / 2;
  var hh = height / 2;
  return new L.LatLngBounds(new L.LatLng(cy - hh, cx - hw), new L.LatLng(cy + hh, cx + hw));
}
