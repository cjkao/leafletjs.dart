@JS('')
library leafletjs.icon;

import 'dart:html' as html;
import 'dart:js';

import 'package:js/js.dart';

import '../../core/class.dart';
import '../../geometry/point.dart';

///not compitable
Icon getDefaultIcon() => new JsObject(context['L']['Icon']['Default'], []) as Icon;

@JS('L.icon')
class Icon extends IClass {
  ///  constructor
  external Icon([IconOptions options]);

  /// @method åcreateIcon(oldIcon?: HTMLElement): HTMLElement
  /// Called internally when the icon has to be shown, returns a `<img>` HTML element
  /// styled according to the options.
  external html.Element createIcon([html.Element oldIcon]);

  /// @method createShadow(oldIcon?: HTMLElement): HTMLElement
  /// As `createIcon`, but for the shadow beneath it.
  external html.Element createShadow([html.Element oldIcon]);
}

//// @section
/// @aka Icon options
///
/// @option iconUrl: String = null
/// **(required)*///The URL to the icon image (absolute or relative to your script path).
///
/// @option iconRetinaUrl: String = null
/// The URL to a retina sized version of the icon image (absolute or relative to your
/// script path). Used for Retina screen devices.
///
/// @option iconSize: Point = null
/// Size of the icon image in pixels.
///
/// @option iconAnchor: Point = null
/// The coordinates of the "tip" of the icon (relative to its top left corner). The icon
/// will be aligned so that this point is at the marker's geographical location. Centered
/// by default if size is specified, also can be set in CSS with negative margins.
///
/// @option popupAnchor: Point = null
/// The coordinates of the point from which popups will "open", relative to the icon anchor.
///
/// @option shadowUrl: String = null
///The URL to the icon shadow image. If not specified, no shadow image will be created.
///
/// @option shadowRetinaUrl: String = null
///
/// @option shadowSize: Point = null
///Size of the shadow image in pixels.
///
/// @option shadowAnchor: Point = null
///The coordinates of the "tip" of the shadow (relative to its top left corner) (the same
///as iconAnchor if not specified).
///
/// @option className: String = ''
///A custom class name to assign to both icon and shadow images. Empty by default.
////
@JS()
@anonymous
class IconOptions {
  external String get iconUrl;
  external void set iconUrl(String _);
  external String get iconRetinaUrl;
  external void set iconRetinaUrl(String _);
  external List<num> get iconSize;
  external void set iconSize(List<num> _);
  external Point get iconAnchor;
  external void set iconAnchor(Point _);
  external String get shadowUrl;
  external void set shadowUrl(String _);
  external String get shadowRetinaUrl;
  external void set shadowRetinaUrl(String _);
  external Point get shadowSize;
  external void set shadowSize(Point _);
  external Point get shadowAnchor;
  external void set shadowAnchor(Point _);
  external Point get popupAnchor;
  external void set popupAnchor(Point _);
  external String get className;
  external void set className(String _);

  ///
  ///Creates an icon instance with the given options.
  ///
  external factory IconOptions(
      {String iconUrl,
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
