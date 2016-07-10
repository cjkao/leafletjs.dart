@JS('')
library leafletjs.controlscale;

import '../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import 'control.js.dart';

////
/// @class Control.Scale
/// @aka L.Control.Scale
/// @inherits Control
///
/// A simple scale control that shows the scale of the current center of screen in metric (m/km) and imperial (mi/ft) systems. Extends `Control`.
///
/// @example
///
/// ```js
/// L.control.scale().addTo(map);
/// ```
////
@JS('L.control.scale')
class ControlScale extends Control {
  ///  constructor
  external ControlScale([options]);

  external html.Element onAdd(L.Map map);

  external void onRemove(L.Map map);
}

@JS()
@anonymous
class ControlScaleOptions extends ControlOptions {
  /// default [position] : 'bottomleft'
  external String get position;
  external void set position(String _);

  /// default [maxWidth] : 100
  external num get maxWidth;
  external void set maxWidth(num _);

  /// default [metric] : true
  external bool get metric;
  external void set metric(bool _);

  /// default [imperial] : true
  external bool get imperial;
  external void set imperial(bool _);

  external factory ControlScaleOptions({String position, num maxWidth, bool metric, bool imperial});
}
