@JS('')
library leafletjs.gridlayer;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import '../../point.dart';
import '../layer.dart';

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
  /// default [tileSize] : 256
  external num get tileSize;
  external void set tileSize(num _);

  /// default [opacity] : 1
  external num get opacity;
  external void set opacity(num _);

  /// default [updateWhenIdle] : L.Browser.mobile
  external String get updateWhenIdle;
  external void set updateWhenIdle(String _);

  /// default [updateWhenZooming] : true
  external bool get updateWhenZooming;
  external void set updateWhenZooming(bool _);

  /// default [updateInterval] : 200
  ///	Tiles will not update more than once every `updateInterval` milliseconds when panning.
  external num get updateInterval;
  external void set updateInterval(num _);

  /// default [attribution] : null
  // String to be shown in the attribution control, describes the layer data, e.g. "© Mapbox".
  external String get attribution;
  external void set attribution(String _);

  /// default [zIndex] : 1
  external num get zIndex;
  external void set zIndex(num _);

  /// default [bounds] : null
  external String get bounds;
  external void set bounds(String _);

  /// default [minZoom] : 0
  external num get minZoom;
  external void set minZoom(num _);

  /// default [maxZoom] : undefined
  external num get maxZoom;
  external void set maxZoom(num _);

  /// default [noWrap] : false
  external bool get noWrap;
  external void set noWrap(bool _);

  /// default [pane] : 'tilePane'
  external String get pane;
  external void set pane(String _);

  /// default [className] : ''
  external String get className;
  external void set className(String _);

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
      String bounds,
      num minZoom,
      num maxZoom,
      bool noWrap,
      String pane,
      String className,
      num keepBuffer});
}
