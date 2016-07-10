@JS('')
library leafletjs.imageoverlay;

import '../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import 'layer.dart';
import '../lat.lng.bounds.dart';

////
/// @class ImageOverlay
/// @aka L.ImageOverlay
/// @inherits Interactive layer
///
/// Used to load and display a single image over specific bounds of the map. Extends `Layer`.
///
/// @example
///
/// ```js
/// var imageUrl = 'http://www.lib.utexas.edu/maps/historical/newark_nj_1922.jpg',
/// 	imageBounds = [[40.712216, -74.22655], [40.773941, -74.12544]];
/// L.imageOverlay(imageUrl, imageBounds).addTo(map);
/// ```
////
@JS('L.imageOverlay')
class ImageOverlay extends Layer {
  ///  constructor
// @factory L.imageOverlay(imageUrl: String, bounds: LatLngBounds, options?: ImageOverlay options)
// Instantiates an image overlay object given the URL of the image and the
// geographical bounds it is tied to.
  external ImageOverlay(String imageUrl, List<LatLngBounds> latlngBounds, [ImageOverlayOptions options]);

  external dynamic onAdd();

  external dynamic onRemove();

  /// @method setOpacity(): this
  /// Sets the opacity of the overlay.
  external ImageOverlay setOpacity();

  external dynamic setStyle(styleOpts);

  /// @method bringToFront(): this
  /// Brings the layer to the top of all overlays.
  external ImageOverlay bringToFront();

  /// @method bringToBack(): this
  /// Brings the layer to the bottom of all overlays.
  external ImageOverlay bringToBack();

  /// @method setUrl(url: String): this
  /// Changes the URL of the image.
  external ImageOverlay setUrl(String url);

  external dynamic setBounds(bounds);

  external dynamic getAttribution();

  external dynamic getEvents();

  external dynamic getBounds();

  external dynamic getElement();
}

@JS()
@anonymous
class ImageOverlayOptions {
  /// default [opacity] : 1
  external num get opacity;
  external void set opacity(num _);

  /// default [alt] : ''
  external String get alt;
  external void set alt(String _);

  /// default [interactive] : false
  external bool get interactive;
  external void set interactive(bool _);

  /// default [attribution] : null
  external String get attribution;
  external void set attribution(String _);

  /// default [crossOrigin] : false
  external bool get crossOrigin;
  external void set crossOrigin(bool _);

  external factory ImageOverlayOptions(
      {num opacity, String alt, bool interactive, String attribution, bool crossOrigin});
}
/////////////////////////////////////////////
