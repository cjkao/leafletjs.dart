@JS('')
library leafletjs.popup;

import 'package:js/js.dart';

import '../lat.lng.dart';
import '../map.dart' as L;
import 'layer.dart';
import 'divoverlay.js.dart';

/*
 * @class Popup
 * @inherits Layer
 * @aka L.Popup
 * Used to open popups in certain places of the map. Use [Map.openPopup](#map-openpopup) to
 * open popups while making sure that only one popup is open at one time
 * (recommended for usability), or use [Map.addLayer](#map-addlayer) to open as many as you want.
 *
 * @example
 *
 * If you want to just bind a popup to marker click and then open it, it's really easy:
 *
 * ```js
 * marker.bindPopup(popupContent).openPopup();
 * ```
 * Path overlays like polylines also have a `bindPopup` method.
 * Here's a more complicated way to open a popup on a map:
 *
 * ```js
 * var popup = L.popup()
 * 	.setLatLng(latlng)
 * 	.setContent('<p>Hello world!<br />This is a nice popup.</p>')
 * 	.openOn(map);
 * ```
 */
@JS('L.popup')
class Popup extends DivOverlay {
  ///  constructor
  ///  options?: Popup options, source?: Layer
  external Popup([PopupOptions options, Layer source]);

  external dynamic onAdd(L.Map map);

  /// @namespace Popup
  /// @method openOn(map: Map): this
  /// Adds the popup to the map and closes the previous one. The same as `map.openPopup(popup)`.
  external Popup openOn(Map map);

  external dynamic onRemove(L.Map map);

  /// @namespace Popup
  /// @method getLatLng: LatLng
  /// Returns the geographical point of popup.
  external LatLng getLatLng();

  /// @method setLatLng(latlng: LatLng): this
  /// Sets the geographical point where the popup will open.
  external Popup setLatLng(LatLng latlng);

  /// @method getContent: String|HTMLElement
  /// Returns the content of the popup.
  external dynamic getContent();

  /// @method setContent(htmlContent: String|HTMLElement|Function): this
  /// Sets the HTML content of the popup. If a function is passed the source layer will be passed to the function. The function should return a `String` or `HTMLElement` to be used in the popup.
  external Popup setContent(dynamic htmlContent);

  /// @method getElement: String|HTMLElement
  /// Alias for [getContent()](#popup-getcontent)
  external dynamic getElement();

  /// @method update: null
  /// Updates the popup content, layout and position. Useful for updating the popup after something inside changed, e.g. image loaded.
  external update();

  external dynamic getEvents();

  /// @method isOpen: Boolean
  /// Returns `true` when the popup is visible on the map.
  external bool isOpen();

  /// @method bringToFront: this
  /// Brings this popup in front of other popups (in the same map pane).
  external Popup bringToFront();

  /// @method bringToBack: this
  /// Brings this popup to the back of other popups (in the same map pane).
  external Popup bringToBack();
}

@JS()
@anonymous
class PopupOptions {
  /// default [maxWidth] : 300
  external num get maxWidth;
  external void set maxWidth(num _);

  /// default [minWidth] : 50
  external num get minWidth;
  external void set minWidth(num _);

  /// default [maxHeight] : null
  external String get maxHeight;
  external void set maxHeight(String _);

  /// default [autoPan] : true
  external bool get autoPan;
  external void set autoPan(bool _);

  /// default [autoPanPaddingTopLeft] : null
  external String get autoPanPaddingTopLeft;
  external void set autoPanPaddingTopLeft(String _);

  /// default [autoPanPaddingBottomRight] : null
  external String get autoPanPaddingBottomRight;
  external void set autoPanPaddingBottomRight(String _);

  /// default [autoPanPadding] : [5, 5]
  external List get autoPanPadding;
  external void set autoPanPadding(List _);

  /// default [keepInView] : false
  external bool get keepInView;
  external void set keepInView(bool _);

  /// default [closeButton] : true
  external bool get closeButton;
  external void set closeButton(bool _);

  /// default [offset] : [0, 7]
  external List get offset;
  external void set offset(List _);

  /// default [autoClose] : true
  external bool get autoClose;
  external void set autoClose(bool _);

  /// @option className: String = ''
  /// A custom CSS class name to assign to the popup.
  external String get className;
  external void set className(String _);

  /// default [zoomAnimation] : true
  external bool get zoomAnimation;
  external void set zoomAnimation(bool _);

  /// default [className] : ''
  external String get className;
  external void set className(String _);

  /// default [pane] : 'popupPane'
  external String get pane;
  external void set pane(String _);

  external factory PopupOptions(
      {num maxWidth,
      num minWidth,
      String maxHeight,
      bool autoPan,
      String autoPanPaddingTopLeft,
      String autoPanPaddingBottomRight,
      List autoPanPadding,
      bool keepInView,
      bool closeButton,
      List offset,
      bool autoClose,
      bool zoomAnimation,
      String className,
      String pane});
}
