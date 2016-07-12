@JS('')
library leafletjs.tilelayer;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import '../../lat.lng.bounds.dart';
import '../layer.dart';
import 'gridlayer.js.dart';
import '../../lat.lng.dart';

////
/// @class TileLayer
/// @inherits GridLayer
/// @aka L.TileLayer
/// Used to load and display tile layers on the map. Extends `GridLayer`.
///
/// @example
///
/// ```js
/// L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png?{foo}', {foo: 'bar'}).addTo(map);
/// ```
///
/// @section URL template
/// @example
///
/// A string of the following form:
///
/// ```
/// 'http://{s}.somedomain.com/blabla/{z}/{x}/{y}{r}.png'
/// ```
///
/// `{s}` means one of the available subdomains (used sequentially to help with browser parallel requests per domain limitation; subdomain values are specified in options; `a`, `b` or `c` by default, can be omitted), `{z}` — zoom level, `{x}` and `{y}` — tile coordinates. `{r}` can be used to add @2x to the URL to load retina tiles.
///
/// You can use custom keys in the template, which will be [evaluated](#util-template) from TileLayer options, like this:
///
/// ```
/// L.tileLayer('http://{s}.somedomain.com/{foo}/{z}/{x}/{y}.png', {foo: 'bar'});
/// ```
////
@JS('L.tileLayer')
class TileLayer extends GridLayer {
  external TileLayerOptions get options;

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
  /// @option minZoom: Number = 0
  /// Minimum zoom number.
  /// default [minZoom] : 0
  external num get minZoom;
  external void set minZoom(num _);

  /// @option maxZoom: Number = 18
  /// Maximum zoom number.
  /// default [maxZoom] : 18
  external num get maxZoom;
  external void set maxZoom(num _);

  /// @option maxNativeZoom: Number = null
  /// Maximum zoom number the tile source has available. If it is specified,
  /// the tiles on all zoom levels higher than `maxNativeZoom` will be loaded
  /// from `maxNativeZoom` level and auto-scaled.
  /// default [maxNativeZoom] : null
  external num get maxNativeZoom;
  external void set maxNativeZoom(num _);

  /// @option subdomains: String|String[] = 'abc'
  /// Subdomains of the tile service. Can be passed in the form of one string (where each letter is a subdomain name) or an array of strings.
  /// default [subdomains] : 'abc'
  external String get subdomains;
  external void set subdomains(String _);

  /// @option errorTileUrl: String = ''
  /// URL to the tile image to show in place of the tile that failed to load.
  /// default [errorTileUrl] : ''
  external String get errorTileUrl;
  external void set errorTileUrl(String _);

  /// @option zoomOffset: Number = 0
  /// The zoom number used in tile URLs will be offset with this value.
  /// default [zoomOffset] : 0
  external num get zoomOffset;
  external void set zoomOffset(num _);

  /// @option tms: Boolean = false
  /// If `true`, inverses Y axis numbering for tiles (turn this on for [TMS](https://en.wikipedia.org/wiki/Tile_Map_Service) services).
  /// default [tms] : false
  external bool get tms;
  external void set tms(bool _);

  /// @option zoomReverse: Boolean = false
  /// If set to true, the zoom number used in tile URLs will be reversed (`maxZoom - zoom` instead of `zoom`)
  /// default [zoomReverse] : false
  external bool get zoomReverse;
  external void set zoomReverse(bool _);

  /// @option detectRetina: Boolean = false
  /// If `true` and user is on a retina display, it will request four tiles of half the specified size and a bigger zoom level in place of one to utilize the high resolution.
  /// default [detectRetina] : false
  external bool get detectRetina;
  external void set detectRetina(bool _);

  /// @option crossOrigin: Boolean = false
  /// If true, all tiles will have their crossOrigin attribute set to ''. This is needed if you want to access tile pixel data.
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
      LatLngBounds bounds,
      bool noWrap,
      String pane,
      String className,
      num keepBuffer,
      String id,
      String accessToken});
}
