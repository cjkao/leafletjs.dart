@JS('')
library leafletjs.controlattribution;

import '../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import 'control.js.dart';

////
/// @class Control.Attribution
/// @aka L.Control.Attribution
/// @inherits Control
///
/// The attribution control allows you to display attribution data in a small text box on a map. It is put on the map by default unless you set its [`attributionControl` option](#map-attributioncontrol) to `false`, and it fetches attribution texts from layers with the [`getAttribution` method](#layer-getattribution) automatically. Extends Control.
////
@JS('L.control.attribution')
class ControlAttribution extends Control {
  ///  constructor
  external ControlAttribution([options]);

  external dynamic onAdd(L.Map map);

  /// @method setPrefix(prefix: String): this
  /// Sets the text before the attributions.
  external ControlAttribution setPrefix(String prefix);

  /// @method addAttribution(text: String): this
  /// Adds an attribution text (e.g. `'Vector data &copy; Mapbox'`).
  external ControlAttribution addAttribution(String text);

  /// @method removeAttribution(text: String): this
  /// Removes an attribution text.
  external ControlAttribution removeAttribution(String text);
}

@JS()
@anonymous
class ControlAttributionOptions extends ControlOptions {
  /// default [position] : 'bottomright'
  external String get position;
  external void set position(String _);

  /// default [prefix] : '<a href="http
  external String get prefix;
  external void set prefix(String _);

  external factory ControlAttributionOptions({String position, String prefix});
}