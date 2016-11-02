@JS('')
library leafletjs.tooltip;

import '../map.dart' as L;
import 'package:js/js.dart';
import 'layer.dart';

@JS('L.tooltip')
class Tooltip {
  ///  constructor
  external Tooltip([options, Layer source]);

  /// @section
  /// @aka Tooltip options
  /// @option pane: String = 'tooltipPane'
  /// `Map pane` where the tooltip will be added.
  /// @option offset: Point = Point(6, -6)
  /// The offset of the tooltip position. Update it if you customize the
  /// tooltip tip in CSS.
  /// @option direction: String = 'auto'
  /// Direction where to open the tooltip. Possible values are: `right`, `left`,
  /// `top`, `bottom`, `center`, `auto`.
  /// `auto` will dynamicaly switch between `right` and `left` according to the tooltip
  /// position on the map.
  /// @option permanent: Boolean = false
  /// Whether to open the tooltip permanently or only on mouseover.
  /// @option sticky: Boolean = false
  /// If true, the tooltip will follow the mouse instead of being fixed at the feature center.
  /// @option interactive: Boolean = false
  /// If true, the tooltip will listen to the feature events.
  /// @option opacity: Number = 0.9
  /// Tooltip container opacity.
  external dynamic onAdd(L.Map map);

  external dynamic onRemove(L.Map map);

  external dynamic setOpacity(opacity);
  external dynamic getEvents();
}

@JS()
@anonymous
class TooltipOptions {
  /// default [pane] : 'tooltipPane'
  external String get pane;
  external void set pane(String _);

  /// default [offset] : [6, -6]
  external List get offset;
  external void set offset(List _);

  /// default [direction] : 'auto'
  external String get direction;
  external void set direction(String _);

  /// default [permanent] : false
  external bool get permanent;
  external void set permanent(bool _);

  /// default [sticky] : false
  external bool get sticky;
  external void set sticky(bool _);

  /// default [interactive] : false
  external bool get interactive;
  external void set interactive(bool _);

  /// default [opacity] : 0.9
  external num get opacity;
  external void set opacity(num _);

  external factory TooltipOptions(
      {String pane, List offset, String direction, bool permanent, bool sticky, bool interactive, num opacity});
}
