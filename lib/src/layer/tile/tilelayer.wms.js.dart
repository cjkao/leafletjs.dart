@JS('')
library leafletjs.tilelayerwms;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import 'tilelayer.js.dart';

@JS('L.tileLayer.wms')
class TileLayerWMS extends TileLayer {
  ///  constructor
  ///  // @factory L.tileLayer.wms(baseUrl: String, options: TileLayer.WMS options)
  // Instantiates a WMS tile layer object given a base URL of the WMS service and a WMS parameters/options object.
  external TileLayerWMS(String baseUrl, [TileLayerWMSOptions options]);

  external void onAdd([L.Map map]);

  external String getTileUrl(coords);

  /// @method setParams(params: Object, noRedraw?: Boolean): this
  /// Merges an object with the new parameters and re-requests tiles on the current screen (unless `noRedraw` was set to true).
  external TileLayerWMS setParams(Object params, [bool noRedraw]);
}

@JS()
@anonymous
class TileLayerWMSOptions extends TileLayerOptions {
  /// default [crs] : null
  external String get crs;
  external void set crs(String _);

  /// default [uppercase] : false
  external bool get uppercase;
  external void set uppercase(bool _);

  external factory TileLayerWMSOptions(
      {String crs,
      bool uppercase,
      num minZoom,
      num maxZoom,
      String maxNativeZoom,
      String subdomains,
      String errorTileUrl,
      num zoomOffset,
      bool tms,
      bool zoomReverse,
      bool detectRetina,
      bool crossOrigin,
      num tileSize,
      num opacity,
      String updateWhenIdle,
      bool updateWhenZooming,
      num updateInterval,
      String attribution,
      num zIndex,
      String bounds,
      bool noWrap,
      String pane,
      String className,
      num keepBuffer,
      String id,
      String accessToken});
}
