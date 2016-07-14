@JS()
library leafletjs.layer;

import "package:js/js.dart";
import '../map.dart' as L;
import 'dart:html' as html;
import '../core/events.js.dart';
import 'popup.js.dart';
import '../lat.lng.dart';

////
/// @class Layer
/// @inherits Evented
/// @aka L.Layer
/// @aka ILayer
///
/// A set of methods from the Layer base class that all Leaflet layers use.
/// Inherits all methods, options and events from `L.Evented`.
///
/// @example
///
/// ```js
/// var layer = L.Marker(latlng).addTo(map);
/// layer.addTo(map);
/// layer.remove();
/// ```
///
/// @event add: Event
/// Fired after the layer is added to a map
///
/// @event remove: Event
/// Fired after the layer is removed from a map
////
@JS()
class Layer extends Evented {
//  external void onAdd(L.Map map);
//  external void onRemove(Map map);

  //// @section
  /// Classes extending `L.Layer` will inherit the following methods:
  ///
  /// @method addTo(map: Map): this
  /// Adds the layer to the given map
  ////
  external Layer addTo(L.Map map);

  // @method remove: this
  // Removes the layer from the map it is currently active on.
  external Layer remove();

  // @method removeFrom(map: Map): this
  // Removes the layer from the given map
  external Layer removeFrom(L.Map map);

  // @method getPane(name? : String): HTMLElement
  // Returns the `HTMLElement` representing the named pane on the map. If `name` is omitted, returns the pane for this layer.
  external html.Element getPane([String name]);

  external Layer addInteractiveTarget(html.Element targetEl);

  external Layer removeInteractiveTarget(html.Element targetEl);

////pop up area
  ///
  ///
////
  /// @namespace Layer
  /// @section Popup methods example
  ///
  /// All layers share a set of methods convenient for binding popups to it.
  ///
  /// ```js
  /// var layer = L.Polygon(latlngs).bindPopup('Hi There!').addTo(map);
  /// layer.openPopup();
  /// layer.closePopup();
  /// ```
  ///
  /// Popups will also be automatically opened when the layer is clicked on and closed when the layer is removed from the map or another popup is opened.

  ///
  /// @method bindPopup(content: String|HTMLElement|Function|Popup, options?: Popup options): this
  /// Binds a popup to the layer with the passed `content` and sets up the
  /// neccessary event listeners. If a `Function` is passed it will receive
  /// the layer as the first argument and should return a `String` or `HTMLElement`.
  external Popup bindPopup(dynamic content, [options]);

  /// @method unbindPopup(): this
  /// Removes the popup previously bound with `bindPopup`.
  external Popup unbindPopup();

  /// @method openPopup(latlng?: LatLng): this
  /// Opens the bound popup at the specificed `latlng` or at the default popup anchor if no `latlng` is passed.
  external Popup openPopup([LatLng latlng]);

  /// @method closePopup(): this
  /// Closes the popup bound to this layer if it is open.
  external Popup closePopup();

  /// @method closePopup(): this
  /// Opens or closes the popup bound to this layer depending on its current state.
  external Popup togglePopup();

  /// @method closePopup(): this
  /// Returns `true` if the popup bound to this layer is currently open.
  external Popup isPopupOpen();

  /// @method setPopupContent(content: String|HTMLElement|Popup, options?: Popup options): this
  /// Sets the content of the popup bound to this layer.
  external Popup setPopupContent(dynamic content, [options]);

  /// @method getPopup(): Popup
  /// Returns the popup bound to this layer.
  external Popup getPopup();
}

/// functions mix into Map
abstract class IMapLayer {
  ///
  ///Removes the given layer from the map.
  ///
  L.Map removeLayer(Layer layer);

  // Adds the given layer to the map
  L.Map addLayer(Layer layer);

  // @method hasLayer(layer: Layer): Boolean
  // Returns `true` if the given layer is currently added to the map
  bool hasLayer(Layer layer);

  //// @method eachLayer(fn: Function, context?: Object): this
  /// Iterates over the layers of the map, optionally specifying context of the iterator function.
  /// ```
  /// map.eachLayer(function(layer){
  ///     layer.bindPopup('Hello');
  /// });
  /// ```
  ////
  L.Map eachLayer(Function method, [context]);

  ///supress warning
  noSuchMethod(_);
}
