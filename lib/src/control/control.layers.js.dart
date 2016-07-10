@JS('')
library leafletjs.controllayers;

import '../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import '../layer/layer.dart';
import 'control.js.dart';

////
/// @class Control.Layers
/// @aka L.Control.Layers
/// @inherits Control
///
/// The layers control gives users the ability to switch between different base layers and switch overlays on/off (check out the [detailed example](http://leafletjs.com/examples/layers-control.html)). Extends `Control`.
///
/// @example
///
/// ```js
/// var baseLayers = {
/// 	"Mapbox": mapbox,
/// 	"OpenStreetMap": osm
/// };
///
/// var overlays = {
/// 	"Marker": marker,
/// 	"Roads": roadsLayer
/// };
///
/// L.control.layers(baseLayers, overlays).addTo(map);
/// ```
///
/// The `baseLayers` and `overlays` parameters are object literals with layer names as keys and `Layer` objects as values:
///
/// ```js
/// {
///     "<someName1>": layer1,
///     "<someName2>": layer2
/// }
/// ```
///
/// The layer names can contain HTML, which allows you to add additional styling to the items:
///
/// ```js
/// {"<img src='my-layer-icon' /> <span class='my-layer-item'>My Layer</span>": myLayer}
/// ```
////
@JS('L.control.layers')
class ControlLayers extends Control {
  ///  constructor
  /// @factory L.control.layers(baselayers?: Object, overlays?: Object, options?: Control.Layers options)
  /// Creates an attribution control with the given layers. Base layers will be switched with radio buttons, while overlays will be switched with checkboxes. Note that all base layers should be passed in the base layers object, but only one should be added to the map during map instantiation.
  ///
  /// var overlays = {
  /// 	"Marker": marker,
  /// 	"Roads": roadsLayer
  /// };
  external ControlLayers([Layer baseLayers, Map overlays, ControlLayersOptions options]);

  external html.Element onAdd(L.Map map);

  external dynamic onRemove();

  /// @method addBaseLayer(layer: Layer, name: String): this
  /// Adds a base layer (radio button entry) with the given name to the control.
  external ControlLayers addBaseLayer(Layer layer, String name);

  /// @method addOverlay(layer: Layer, name: String): this
  /// Adds an overlay (checkbox entry) with the given name to the control.
  external ControlLayers addOverlay(Layer layer, String name);

  /// @method removeLayer(layer: Layer): this
  /// Remove the given layer from the control.
  external ControlLayers removeLayer(Layer layer);

  /// @method expand(): this
  /// Expand the control container if collapsed.
  external ControlLayers expand();

  /// @method collapse(): this
  /// Collapse the control container if expanded.
  external ControlLayers collapse();
}

@JS()
@anonymous
class ControlLayersOptions extends ControlOptions {
  /// default [position] : 'topright'
  external String get position;
  external void set position(String _);

  /// default [autoZIndex] : true
  external bool get autoZIndex;
  external void set autoZIndex(bool _);

  /// default [hideSingleBase] : false
  external bool get hideSingleBase;
  external void set hideSingleBase(bool _);

  external factory ControlLayersOptions({String position, bool autoZIndex, bool hideSingleBase});
}
