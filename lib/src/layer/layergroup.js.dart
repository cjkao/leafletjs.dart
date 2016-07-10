@JS('')
library leafletjs.layergroup;

import '../map.dart' as L;
import 'package:js/js.dart';
import 'layer.dart';

@JS('L.layerGroup')
class LayerGroup extends Layer {
  ///  constructor
  external LayerGroup([List<Layer> layers]);

  /// @method addLayer(layer: Layer): this
  /// Adds the given layer to the group.
  external LayerGroup addLayer(Layer layer);

  /// @method removeLayer(layer: Layer): this
  /// Removes the given layer from the group.
  /// @alternative
  /// @method removeLayer(id: Number): this
  /// Removes the layer with the given internal ID from the group.
  external LayerGroup removeLayer(Layer layer);

  /// @method hasLayer(layer: Layer): Boolean
  /// Returns `true` if the given layer is currently added to the group.
  external bool hasLayer(Layer layer);

  /// @method clearLayers(): this
  /// Removes all the layers from the group.
  external LayerGroup clearLayers();

  /// @method invoke(methodName: String, …): this
  /// Calls `methodName` on every layer contained in this group, passing any
  /// additional parameters. Has no effect if the layers contained do not
  /// implement `methodName`.
  external LayerGroup invoke(String methodName);

  external dynamic onAdd(L.Map map);

  external dynamic onRemove(L.Map map);

  /// @method eachLayer(fn: Function, context?: Object): this
  /// Iterates over the layers of the group, optionally specifying context of the iterator function.
  /// ```js
  /// group.eachLayer(function (layer) {
  /// 	layer.bindPopup('Hello');
  /// });
  /// ```
  external LayerGroup eachLayer(Function fn, [Object context]);

  /// @method getLayer(id: Number): Layer
  /// Returns the layer with the given internal ID.
  external Layer getLayer(num id);

  /// @method getLayers(): Layer[]
  /// Returns an array of all the layers added to the group.
  external List<Layer> getLayers();

  /// @method setZIndex(zIndex: Number): this
  /// Calls `setZIndex` on every layer contained in this group, passing the z-index.
  external LayerGroup setZIndex(num zIndex);

  /// @method getLayerId(layer: Layer): Number
  /// Returns the internal ID for a layer
  external num getLayerId(Layer layer);
}
