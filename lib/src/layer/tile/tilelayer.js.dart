@JS('')
library leafletjs.tilelayer;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';

import '../layer.dart';
import 'gridlayer.js.dart';
import '../../lat.lng.dart';

////
/// @class TileLayer.WMS
/// @inherits TileLayer
/// @aka L.TileLayer.WMS
/// Used to display [WMS](https://en.wikipedia.org/wiki/Web_Map_Service) services as tile layers on the map. Extends `TileLayer`.
///
/// @example
///
/// ```js
/// var nexrad = L.tileLayer.wms("http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi", {
/// 	layers: 'nexrad-n0r-900913',
/// 	format: 'image/png',
/// 	transparent: true,
/// 	attribution: "Weather data © 2012 IEM Nexrad"
/// });
/// ```
////
@JS('L.tileLayer')
class TileLayer extends GridLayer {
  ///  constructor
  external TileLayer([String urlTemplate, TileLayerOptions options]);

  /// @method setUrl(url: String, noRedraw?: Boolean): this
  /// Updates the layer's URL template and redraws it (unless `noRedraw` is set to `true`).
  external TileLayer setUrl(String url, [bool noRedraw]);

  /// @method createTile(coords: Object, done?: Function): HTMLElement
  /// Called only internally, overrides GridLayer's [`createTile()`](#gridlayer-createtile)
  /// to return an `<img>` HTML element with the appropiate image URL given `coords`. The `done`
  /// callback is called when the tile has been loaded.
  external html.Element createTile(Object coords, [Function done]);

  /// @section Extension methods
  /// @uninheritable
  /// Layers extending `TileLayer` might reimplement the following method.
  /// @method getTileUrl(coords: Object): String
  /// Called only internally, returns the URL for a tile given its coordinates.
  /// Classes extending `TileLayer` can override this function to provide custom tile URL naming schemes.
  external String getTileUrl(Object coords);

  //external num getTileSize();
}

@JS()
@anonymous
class TileLayerOptions extends GridLayerOptions {
  /// default [minZoom] : 0
  external num get minZoom;
  external void set minZoom(num _);

  /// default [maxZoom] : 18
  external num get maxZoom;
  external void set maxZoom(num _);

  /// default [maxNativeZoom] : null
  external String get maxNativeZoom;
  external void set maxNativeZoom(String _);

  /// default [subdomains] : 'abc'
  external String get subdomains;
  external void set subdomains(String _);

  /// default [errorTileUrl] : ''
  external String get errorTileUrl;
  external void set errorTileUrl(String _);

  /// default [zoomOffset] : 0
  external num get zoomOffset;
  external void set zoomOffset(num _);

  /// default [tms] : false
  external bool get tms;
  external void set tms(bool _);

  /// default [zoomReverse] : false
  external bool get zoomReverse;
  external void set zoomReverse(bool _);

  /// default [detectRetina] : false
  external bool get detectRetina;
  external void set detectRetina(bool _);

  /// default [crossOrigin] : false
  external bool get crossOrigin;
  external void set crossOrigin(bool _);

  external factory TileLayerOptions(
      {num minZoom,
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
