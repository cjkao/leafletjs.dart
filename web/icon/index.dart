@JS()
library mymain;

//import 'dart:math' hide Rectangle;
import 'dart:js';
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
          maxBounds: new L.LatLngBounds([
            [-128, -128],
            [128, 128]
          ]),
          crs: sCRS,
          wheelDebounceTime: 90,
          minZoom: 1,
          zoom: 1,
          zoomControl: true));
  var clickfun = allowInterop((L.Event evt) {
    print('${evt.type}  ${evt.latlng.lng} ${evt.latlng.lat}');
    print(evt.containerPoint.x);
  });

  _map.on('click', clickfun);
  var tileLayer = new TileLayer('../tile/small-{z}-{x}-{y}.png',
          new TileLayerOptions(maxZoom: 4, accessToken: accessToken, noWrap: true, errorTileUrl: 'empty.png'))
      .addTo(_map);

  var bb = geo.bounds([1, 2]);

  var myIcon = IconDefault; //new DivIcon(new DivIconOptions(className: 'my-div-icon'));
  myIcon.iconSize[0] = 40;
  print(myIcon);
  var LeafIcon = new Icon();
  new Marker([51.5, -0.09], new MarkerOptions(icon: LeafIcon)).addTo(_map).bindPopup("I am a green leaf.");

  ///var opt = myIcon.options as DivIconOptions;
  //print(opt.className);
  var litLayer = new Dynamic();
  litLayer['city'] = tileLayer;
  litLayer['street'] = tileLayer;

  new ctrl.Layers(litLayer.source)..addTo(_map);
  new ctrl.Scale().addTo(_map);
}

testLayer() {}

L.LatLngBounds getBounds(num cx, num cy, num width, num height) {
  var hw = width / 2;
  var hh = height / 2;
  return new L.LatLngBounds(new L.LatLng(cy - hh, cx - hw), new L.LatLng(cy + hh, cx + hw));
}
