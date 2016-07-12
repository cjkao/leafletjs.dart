@JS('')
library leafletjs.gridlayer;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import '../../geometry/point.dart';
import '../layer.dart';
import '../../lat.lng.bounds.dart';

@JS('L.gridLayer')
class GridLayer extends Layer {
  ///  constructor
  external GridLayer([GridLayerOptions options]);

  external void onAdd();

  external void beforeAdd(L.Map map);

  external void onRemove(L.Map map);

  /// @method bringToFront: this
  /// Brings the tile layer to the top of all tile layers.
  external GridLayer bringToFront();

  /// @method bringToBack: this
  /// Brings the tile layer to the bottom of all tile layers.
  external GridLayer bringToBack();

  /// @method getAttribution: String
  /// Used by the `attribution control`, returns the [attribution option](#gridlayer-attribution).
  external String getAttribution();

  /// @method getContainer: String
  /// Returns the HTML element that contains the tiles for this layer.
  external String getContainer();

  /// @method setOpacity(opacity: Number): this
  /// Changes the [opacity](#gridlayer-opacity) of the grid layer.
  external GridLayer setOpacity(num opacity);

  /// @method setZIndex(zIndex: Number): this
  /// Changes the [zIndex](#gridlayer-zindex) of the grid layer.
  external GridLayer setZIndex(num zIndex);

  /// @method isLoading: Boolean
  /// Returns `true` if any tile in the grid layer has not finished loading.
  external bool isLoading();

  /// @method redraw: this
  /// Causes the layer to clear all the tiles and request them again.
  external GridLayer redraw();

  external dynamic getEvents();

  /// @section Extension methods
  /// Layers extending `GridLayer` shall reimplement the following method.
  /// @method createTile(coords: Object, done?: Function): HTMLElement
  /// Called only internally, must be overriden by classes extending `GridLayer`.
  /// Returns the `HTMLElement` corresponding to the given `coords`. If the `done` callback
  /// is specified, it must be called when the tile has finished loading and drawing.
  external html.Element createTile(Object coords, [Function done]);

  /// @section
  /// @method getTileSize: Point
  /// Normalizes the [tileSize option](#gridlayer-tilesize) into a point. Used by the `createTile()` method.
  external Point getTileSize();
}

@JS()
@anonymous
class GridLayerOptions {
  /// @option tileSize: Number|Point = 256
  /// Width and height of tiles in the grid. Use a number if width and height are equal, or `L.point(width, height)` otherwise.
  /// default [tileSize] : 256
  external num get tileSize;
  external void set tileSize(num _);

  /// @option opacity: Number = 1.0
  /// Opacity of the tiles. Can be used in the `createTile()` function.
  /// default [opacity] : 1
  external num get opacity;
  external void set opacity(num _);

  /// @option updateWhenIdle: Boolean = depends
  /// If `false`, new tiles are loaded during panning, otherwise only after it (for better performance). `true` by default on mobile browsers, otherwise `false`.
  /// default [updateWhenIdle] : L.Browser.mobile
  external String get updateWhenIdle;
  external void set updateWhenIdle(String _);

  /// @option updateWhenZooming: Boolean = true
  /// By default, a smooth zoom animation (during a [touch zoom](#map-touchzoom) or a [`flyTo()`](#map-flyto)) will update grid layers every integer zoom level. Setting this option to `false` will update the grid layer only when the smooth animation ends.
  /// default [updateWhenZooming] : true
  external bool get updateWhenZooming;
  external void set updateWhenZooming(bool _);

  /// @option updateInterval: Number = 200
  /// Tiles will not update more than once every `updateInterval` milliseconds when panning.
  /// default [updateInterval] : 200
  external num get updateInterval;
  external void set updateInterval(num _);

  /// @option attribution: String = null
  /// String to be shown in the attribution control, describes the layer data, e.g. "© Mapbox".
  /// default [attribution] : null
  external String get attribution;
  external void set attribution(String _);

  /// @option zIndex: Number = 1
  /// The explicit zIndex of the tile layer.
  /// default [zIndex] : 1
  external num get zIndex;
  external void set zIndex(num _);

  /// @option bounds: LatLngBounds = undefined
  /// If set, tiles will only be loaded inside the set `LatLngBounds`.
  /// default [bounds] : null
  external LatLngBounds get bounds;
  external void set bounds(LatLngBounds _);

  /// @option minZoom: Number = 0
  /// The minimum zoom level that tiles will be loaded at. By default the entire map.
  /// default [minZoom] : 0
  external num get minZoom;
  external void set minZoom(num _);

  /// @option maxZoom: Number = undefined
  /// The maximum zoom level that tiles will be loaded at.
  /// default [maxZoom] : undefined
  external num get maxZoom;
  external void set maxZoom(num _);

  /// @option noWrap: Boolean = false
  /// Whether the layer is wrapped around the antimeridian. If `true`, the
  /// GridLayer will only be displayed once at low zoom levels.
  /// default [noWrap] : false
  external bool get noWrap;
  external void set noWrap(bool _);

  /// @option pane: String = 'tilePane'
  /// `Map pane` where the grid layer will be added.
  /// default [pane] : 'tilePane'
  external String get pane;
  external void set pane(String _);

  /// @option className: String = ''
  /// A custom class name to assign to the tile layer. Empty by default.
  /// default [className] : ''
  external String get className;
  external void set className(String _);

  /// @option keepBuffer: Number = 2
  /// When panning the map, keep this many rows and columns of tiles before unloading them.
  /// default [keepBuffer] : 2
  external num get keepBuffer;
  external void set keepBuffer(num _);

  external factory GridLayerOptions(
      {num tileSize,
      num opacity,
      String updateWhenIdle,
      bool updateWhenZooming,
      num updateInterval,
      String attribution,
      num zIndex,
      LatLngBounds bounds,
      num minZoom,
      num maxZoom,
      bool noWrap,
      String pane,
      String className,
      num keepBuffer});
}
