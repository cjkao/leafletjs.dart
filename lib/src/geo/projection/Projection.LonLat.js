/*
 * @namespace Projection
 * @section
 * Leaflet comes with a set of already defined Projections out of the box:
 *
 * @projection L.Projection.LonLat
 *
 * Equirectangular, or Plate Carree projection — the most simple projection,
 * mostly used by GIS enthusiasts. Directly maps `x` as longitude, and `y` as
 * latitude. Also suitable for flat worlds, e.g. game maps. Used by the
 * `EPSG:3395` and `Simple` CRS.
 */

L.Projection = {};

L.Projection.LonLat = {
	project: function (latlng) {
		return new L.Point(latlng.lng, latlng.lat);
	},

	unproject: function (point) {
		return new L.LatLng(point.y, point.x);
	},

	bounds: L.bounds([-180, -90], [180, 90])
};

L.Projection.Map200 = {
	scale:1.28,
	project: function (latlng) {
//		100 => 128
//		-100 => -128
		return new L.Point(latlng.lng*scale, latlng.lat*scale);
	},

	unproject: function (point) {
		return new L.LatLng(point.y/scale, point.x/scale);
	},

	bounds: L.bounds([-100, -100], [100, 100])
}
