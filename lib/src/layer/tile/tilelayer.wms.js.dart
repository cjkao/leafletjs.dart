@JS('')
library leafletjs.tilelayerwms;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import 'tilelayer.js.dart';

@JS('L.tilelayerwms')
class TileLayerWMS extends TileLayer {
  ///  constructor
  external TileLayerWMS();

  external dynamic onAdd(L.Map map);

  external dynamic getTileUrl(coords);

  /// @method setParams(params: Object, noRedraw?: Boolean): this
  /// Merges an object with the new parameters and re-requests tiles on the current screen (unless `noRedraw` was set to true).
  external TileLayerWMS setParams(Object params, [bool noRedraw]);
}

@JS()
@anonymous
class TileLayerWMSOptions {
  /// default [crs] : null
  external String get crs;
  external void set crs(String _);

  /// default [uppercase] : false
  external bool get uppercase;
  external void set uppercase(bool _);

  external factory TileLayerWMSOptions({String crs, bool uppercase});
}
