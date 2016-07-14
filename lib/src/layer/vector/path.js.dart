@JS('')
library leafletjs.path;

import 'package:js/js.dart';

import '../../map.dart' as L;
import '../layer.dart';

///
/// An abstract class that contains options and constants shared between vector
/// overlays (Polygon, Polyline, Circle). Do not use it directly. Extends `Layer`.
////
@JS('L.path')
class Path extends Layer {
  ///  constructor
  external Path();

  external dynamic beforeAdd(L.Map map);

  external dynamic onAdd();

  external dynamic onRemove();

  external dynamic getEvents();

  /// @method redraw(): this
  /// Redraws the layer. Sometimes useful after you changed the coordinates that the path uses.
  external Path redraw();

  /// @method setStyle(style: Path options): this
  /// Changes the appearance of a Path based on the options in the `Path options` object.
  external Path setStyle(PathOptions style);

  /// @method bringToFront(): this
  /// Brings the layer to the top of all path layers.
  external Path bringToFront();

  /// @method bringToBack(): this
  /// Brings the layer to the bottom of all path layers.
  external Path bringToBack();

  external dynamic getElement();
}

@JS()
@anonymous
class PathOptions {
  /// default [stroke] : true
  external bool get stroke;
  external void set stroke(bool _);

  /// default [color] : '#3388ff'
  external String get color;
  external void set color(String _);

  /// default [weight] : 3
  external num get weight;
  external void set weight(num _);

  /// default [opacity] : 1
  external num get opacity;
  external void set opacity(num _);

  /// default [lineCap] : 'round'
  external String get lineCap;
  external void set lineCap(String _);

  /// default [lineJoin] : 'round'
  external String get lineJoin;
  external void set lineJoin(String _);

  /// default [dashArray] : null
  external String get dashArray;
  external void set dashArray(String _);

  /// default [dashOffset] : null
  external String get dashOffset;
  external void set dashOffset(String _);

  /// default [fill] : false
  external bool get fill;
  external void set fill(bool _);

  /// default [fillColor] : null
  external String get fillColor;
  external void set fillColor(String _);

  /// default [fillOpacity] : 0.2
  external num get fillOpacity;
  external void set fillOpacity(num _);

  /// default [fillRule] : 'evenodd'
  external String get fillRule;
  external void set fillRule(String _);

  /// default [/// className] : '',
  /// default [interactive] : true
  external bool get interactive;
  external void set interactive(bool _);

  external factory PathOptions(
      {bool stroke,
      String color,
      num weight,
      num opacity,
      String lineCap,
      String lineJoin,
      String dashArray,
      String dashOffset,
      bool fill,
      String fillColor,
      num fillOpacity,
      String fillRule,
      bool interactive

      /// className,bool interactive
      });
}
