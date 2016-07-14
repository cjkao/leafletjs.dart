//import 'dart:math' hide Rectangle;
import 'dart:js';

import 'package:js/js.dart';
import 'package:leafletjs/leafletjs.dart' as L;
import 'package:leafletjs/leafletjs.layer.dart';
import 'package:leafletjs/src/geo/crs/crs.dart' as crs;

main() async {
  _initMap();
}

_initMap() {
  var crsSim = crs.Simple;
  crsSim.infinite = false;
//  crs: crsSim,
  var _map = new L.Map("map", new L.MapOptions(crs: crsSim, center: new L.LatLng(0, 0), zoom: 1, zoomControl: true));
  var tileLayer = new TileLayer(
      'http://thematicmapping.org/playground/zoomify/books/TileGroup0/{z}-{x}-{y}.jpg',
      new TileLayerOptions(
          noWrap: true,
          errorTileUrl: 'empty.png',
          attribution: 'cjk')); //bounds: new L.LatLngBounds(new L.LatLng(100, 100), new L.LatLng(400, 200)
  tileLayer.addTo(_map);
  _map.on('click', allowInterop((_) {
    print(_map.getBounds().toBBoxString());
    print(tileLayer.options.bounds);
  }));
}
