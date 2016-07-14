@JS('')
library leafletjs.featuregroup;

import 'package:js/js.dart';
import 'layergroup.js.dart';
import 'layer.dart';
import '../lat.lng.bounds.dart';
import 'vector/path.js.dart';

////
/// @class FeatureGroup
/// @aka L.FeatureGroup
/// @inherits LayerGroup
///
/// Extended `LayerGroup` that also has mouse events (propagated from members of the group) and a shared bindPopup method.
///
/// @example
///
/// ```js
/// L.featureGroup([marker1, marker2, polyline])
/// 	.bindPopup('Hello world!')
/// 	.on('click', function() { alert('Clicked on a group!'); })
/// 	.addTo(map);
/// ```
////
@JS('L.featureGroup')
class FeatureGroup extends LayerGroup {
  // @factory L.featureGroup(layers: Layer[])
  ///  constructor,
  external FeatureGroup([List<Layer> layers]);

  external dynamic addLayer(Layer layer);

  external dynamic removeLayer(Layer layer);

  /// @method setStyle(style: Path options): this
  /// Sets the given path options to each layer of the group that has a `setStyle` method.
  external FeatureGroup setStyle(PathOptions style);

  /// @method bringToFront(): this
  /// Brings the layer group to the top of all other layers
  external FeatureGroup bringToFront();

  /// @method bringToBack(): this
  /// Brings the layer group to the top of all other layers
  external FeatureGroup bringToBack();

  /// @method getBounds(): LatLngBounds
  /// Returns the LatLngBounds of the Feature Group (created from bounds and coordinates of its children).
  external LatLngBounds getBounds();
}
