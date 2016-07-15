@JS('')
library leafletjs.divoverlay;

import '../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import '../lat.lng.dart';
import 'layer.dart';

/*
 * @class DivOverlay
 * @inherits Layer
 * @aka L.DivOverlay
 * Base model for L.Popup and L.Tooltip. Inherit from it for custom popup like plugins.
 */
@JS('L.divoverlay')
class DivOverlay extends Layer {
  ///  constructor
  external DivOverlay([options]);

  external dynamic onAdd(L.Map map);

  external dynamic onRemove(L.Map map);

  /// @namespace Popup
  /// @method getLatLng: LatLng
  /// Returns the geographical point of popup.
  external LatLng getLatLng();

  /// @method setLatLng(latlng: LatLng): this
  /// Sets the geographical point where the popup will open.
  external DivOverlay setLatLng(LatLng latlng);

  /// @method getContent: String|HTMLElement
  /// Returns the content of the popup.
  external dynamic getContent();

  /// @method setContent(htmlContent: String|HTMLElement|Function): this
  /// Sets the HTML content of the popup. If a function is passed the source layer will be passed to the function. The function should return a `String` or `HTMLElement` to be used in the popup.
  external DivOverlay setContent(htmlContent);

  /// @method getElement: String|HTMLElement
  /// Alias for [getContent()](#popup-getcontent)
  external dynamic getElement();

  /// @method update: null
  /// Updates the popup content, layout and position. Useful for updating the popup after something inside changed, e.g. image loaded.
  external void update();

  external dynamic getEvents();

  /// @method isOpen: Boolean
  /// Returns `true` when the popup is visible on the map.
  external bool isOpen();

  /// @method bringToFront: this
  /// Brings this popup in front of other popups (in the same map pane).
  external DivOverlay bringToFront();

  /// @method bringToBack: this
  /// Brings this popup to the back of other popups (in the same map pane).
  external DivOverlay bringToBack();
}

@JS()
@anonymous
class DivOverlayOptions {
  /// default [offset] : [0, 7]
  external List get offset;
  external void set offset(List _);

  /// default [zoomAnimation] : true
  external bool get zoomAnimation;
  external void set zoomAnimation(bool _);

  /// default [className] : ''
  external String get className;
  external void set className(String _);

  /// default [pane] : 'popupPane'
  external String get pane;
  external void set pane(String _);

  external factory DivOverlayOptions({List offset, bool zoomAnimation, String className, String pane});
}
