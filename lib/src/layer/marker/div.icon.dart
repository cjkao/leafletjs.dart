@JS()
library leafletjs.div.icon;

import "package:js/js.dart";
import '../../point.dart';
import 'icon.js.dart';

@JS()
@anonymous
class DivIconOptions extends IconOptions {
  external List<num> get iconSize; //: [12, 12], // also can be set through CSS
  external void set iconSize(List<num> _);

  /// Custom HTML code to put inside the div element, empty by default.
  external bool get html;
  external void set html(bool _);

  // @option bgPos: Point = [0, 0]
  // Optional relative position of the background, in pixels
  external Point get bgPos;
  external void set bgPos(Point _);
  external String get className; //: 'leaflet-div-icon'
  external void set className(String _);

  external factory DivIconOptions(
      {bool html,
      Point bgPos,
      String iconUrl,
      String iconRetinaUrl,
      List<num> iconSize,
      Point iconAnchor,
      String shadowUrl,
      String shadowRetinaUrl,
      Point shadowSize,
      Point shadowAnchor,
      Point popupAnchor,
      String className});
}

/*
 * @class DivIcon
 * @aka L.DivIcon
 * @inherits Icon
 *
 * Represents a lightweight icon for markers that uses a simple `<div>`
 * element instead of an image. Inherits from `Icon` but ignores the `iconUrl` and shadow options.
 *
 * @example
 * ```js
 * var myIcon = L.divIcon({className: 'my-div-icon'});
 * // you can set .my-div-icon styles in CSS
 *
 * L.marker([50.505, 30.57], {icon: myIcon}).addTo(map);
 * ```
 *
 * By default, it has a 'leaflet-div-icon' CSS class and is styled as a little white square with a shadow.
 */
@JS('L.divIcon')
class DivIcon extends Icon {
// Creates a `DivIcon` instance with the given options.
  external DivIcon(DivIconOptions options);
}

// @factory L.divIcon(options: DivIcon options)
