@JS()
library map.vector;

//import 'dart:math' hide Rectangle;
import 'dart:async';
import 'dart:js';
import 'dart:html' as html;
import 'package:js/js.dart';
import 'package:leafletjs/leafletjs.control.dart' as ctrl;
import 'package:leafletjs/leafletjs.dart' as L;
import 'package:leafletjs/leafletjs.layer.dart';
//import 'package:leafletjs/src/geo/crs/crs.dart' as crs;
import 'package:leafletjs/leafletjs.geo.dart' as geo;
import 'package:leafletjs/leafletjs.util.dart';

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
          //    maxBounds: new L.LatLngBounds([
          //      [-128, -128],
          //      [128, 128]
          //    ]),
          crs: sCRS,
          wheelDebounceTime: 90,
          minZoom: 1,
          maxZoom: 18,
          zoom: 1,
          zoomControl: true));
  print(_map.zoomControl);
  context['mmm'] = _map;
  testGeo(_map);
  var tileLayer = new TileLayer(
          '../tile/small-{z}-{x}-{y}.png',
          new TileLayerOptions(
              maxZoom: 4, accessToken: accessToken, zIndex: 1, noWrap: true, errorTileUrl: 'empty.png'))
      .addTo(_map);
  var pop = new Popup();
  pop.setContent('htmlContent').setLatLng(new L.LatLng(10, 30)).addTo(_map);
  var myIcon = new DivIcon(new DivIconOptions(className: 'my-div-icon'));
  var opt = myIcon.options as DivIconOptions;
  print(opt.className);
  var litLayer = new Dynamic();
  litLayer['city'] = tileLayer;
  litLayer['street'] = tileLayer;

  new ctrl.Layers(litLayer.source, new ctrl.LayersOptions())..addTo(_map);
  new ctrl.Scale().addTo(_map);
}

testGeo(L.Map _map) async {
//  geoLayer.addTo(_map);
  var json = JSONparse(await html.HttpRequest.getString('../geojson/sample.json'));
  var dyn = new Dynamic();
  dyn['style'] = allowInterop((DynamicSource _) {
    var item = getOwnPropertyDescriptor(_, 'properties');
    var item2 = getOwnPropertyDescriptor(item, 'color');
    //  return new Dynamic.fromMap({'color': item2}).source;
    return item2;
  });
  var geoLayer = new GeoJSON(json, dyn.source);
  _map.addLayer(geoLayer);
}
