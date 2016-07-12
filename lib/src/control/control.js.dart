@JS('')
library leafletjs.control;

import '../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import '../core/class.dart';

////
/// @class Control
/// @aka L.Control
///
/// L.Control is a base class for implementing map controls. Handles positioning.
/// All other controls extend from this class.
////
@JS('L.control')
class Control extends IClass {
  external ControlOptions get options;

  ///  constructor
  external Control([ControlOptions options]);

  external String getPosition();

  /// @method setPosition(position: string): this
  /// Sets the position of the control.
  external Control setPosition(String position);

  /// @method getContainer: HTMLElement
  /// Returns the HTMLElement that contains the control.
  external html.Element getContainer();

  /// @method addTo(map: Map): this
  /// Adds the control to the given map.
  external Control addTo(L.Map map);

  /// @method remove: this
  /// Removes the control from the map it is currently active on.
  external Control remove();
}

@JS()
@anonymous
class ControlOptions {
  /// default [position] : 'topright'
  external String get position;
  external void set position(String _);

  external factory ControlOptions({String position});
}
