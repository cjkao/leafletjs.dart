@JS('')
library leafletjs.geojson;

import '../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import 'featuregroup.js.dart';

////
/// @class GeoJSON
/// @aka L.GeoJSON
/// @inherits FeatureGroup
///
/// Represents a GeoJSON object or an array of GeoJSON objects. Allows you to parse
/// GeoJSON data and display it on the map. Extends `FeatureGroup`.
///
/// @example
///
/// ```js
/// L.geoJson(data, {
/// 	style: function (feature) {
/// 		return {color: feature.properties.color};
/// 	}
/// }).bindPopup(function (layer) {
/// 	return layer.feature.properties.description;
/// }).addTo(map);
/// ```
////
@JS('L.geoJSON')
class GeoJSON extends FeatureGroup {
  ///  constructor
  external GeoJSON([options]);

  /// @function addData( <GeoJSON> data ): Layer
  /// Adds a GeoJSON object to the layer.
  external dynamic addData(geojson);

  /// @function resetStyle( <Path> layer ): Layer
  /// Resets the given vector layer's style to the original GeoJSON style, useful for resetting style after hover events.
  external dynamic resetStyle(layer);

  /// @function setStyle( <Function> style ): Layer
  /// Changes styles of GeoJSON vector layers with the given style function.
  external dynamic setStyle(style);
}
