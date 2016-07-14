@JS('')
library leafletjs.draggable;

import 'dart:html' as html;
import 'package:js/js.dart';

////
/// @class Draggable
/// @aka L.Draggable
/// @inherits Evented
///
/// A class for making DOM elements draggable (including touch support).
/// Used internally for map and marker dragging. Only works for elements
/// that were positioned with [`L.DomUtil.setPosition`](#domutil-setposition).
///
/// @example
/// ```js
/// var draggable = new L.Draggable(elementToDrag);
/// draggable.enable();
/// ```
////
@JS('L.Draggable')
class Draggable {
  ///  constructor
  external Draggable(html.Element el, [html.Element dragHandle, bool preventOutline]);

  /// @method enable()
  /// Enables the dragging ability
  external void enable();

  /// @method disable()
  /// Disables the dragging ability
  external void disable();
}

@JS()
@anonymous
class DraggableOptions {
  /// default [clickTolerance] : 3
  external num get clickTolerance;
  external void set clickTolerance(num _);

  external factory DraggableOptions({num clickTolerance});
}
