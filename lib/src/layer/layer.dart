@JS()
library leafletjs.layer;

import "package:js/js.dart";
import '../map.dart' as L;
import 'dart:html' as html;

//import '../ilayer.dart';
@JS()
class Layer {
//  external void onAdd(L.Map map);
//  external void onRemove(Map map);

  /* @section
  	 * Classes extending `L.Layer` will inherit the following methods:
  	 *
  	 * @method addTo(map: Map): this
  	 * Adds the layer to the given map
  	 */
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
}

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

  /* @method eachLayer(fn: Function, context?: Object): this
  	 * Iterates over the layers of the map, optionally specifying context of the iterator function.
  	 * ```
  	 * map.eachLayer(function(layer){
  	 *     layer.bindPopup('Hello');
  	 * });
  	 * ```
  	 */
  L.Map eachLayer(Function method, [context]);

  ///supress warning
  noSuchMethod(_);
}
