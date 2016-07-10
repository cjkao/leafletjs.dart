@JS('')
library leafletjs.geojson;

import '../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import 'featuregroup.js.dart';
import '../lat.lng.dart';

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
  external GeoJSON([dynamic geojson, options]);

  /// @function addData( <GeoJSON> data ): Layer
  /// Adds a GeoJSON object to the layer.
  external dynamic addData(geojson);

  /// @function resetStyle( <Path> layer ): Layer
  /// Resets the given vector layer's style to the original GeoJSON style, useful for resetting style after hover events.
  external dynamic resetStyle(layer);

  /// @function setStyle( <Function> style ): Layer
  /// Changes styles of GeoJSON vector layers with the given style function.
  external dynamic setStyle(style);
  // @function geometryToLayer(featureData: Object, options?: GeoJSON options): Layer
  // Creates a `Layer` from a given GeoJSON feature. Can use a custom
  // [`pointToLayer`](#geojson-pointtolayer) and/or [`coordsToLatLng`](#geojson-coordstolatlng)
  // functions if provided as options.
  external static geometryToLayer(featureData, [options]);
  // @function coordsToLatLng(coords: Array): LatLng
  // Creates a `LatLng` object from an array of 2 numbers (longitude, latitude)
  // or 3 numbers (longitude, latitude, altitude) used in GeoJSON for points.
  external static LatLng coordsToLatLng(List coords);
  // @function coordsToLatLngs(coords: Array, levelsDeep?: Number, coordsToLatLng?: Function): Array
  // Creates a multidimensional array of `LatLng`s from a GeoJSON coordinates array.
  // `levelsDeep` specifies the nesting level (0 is for an array of points, 1 for an array of arrays of points, etc., 0 by default).
  // Can use a custom [`coordsToLatLng`](#geojson-coordstolatlng) function.
  external static coordsToLatLngs(coords, levelsDeep, coordsToLatLng);

  // @function latLngToCoords(latlng: LatLng): Array
  // Reverse of [`coordsToLatLng`](#geojson-coordstolatlng)
  external static List latLngToCoords(latlng);

  // @function latLngsToCoords(latlngs: Array, levelsDeep?: Number, closed?: Boolean): Array
  // Reverse of [`coordsToLatLngs`](#geojson-coordstolatlngs)
  // `closed` determines whether the first point should be appended to the end of the array to close the feature, only used when `levelsDeep` is 0. False by default.
  external static List latLngsToCoords(List<LatLng> latlngs, [num levelsDeep, bool closed]);

  external static getFeature(layer, newGeometry);

  // @function asFeature(geojson: Object): Object
  // Normalize GeoJSON geometries/features into GeoJSON features.
  external static dynamic asFeature(geojson);
}
