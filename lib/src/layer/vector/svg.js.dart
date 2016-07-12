@JS('')
library leafletjs.svg;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import 'renderer.js.dart';
import '../../geometry/point.dart';
////
/// @class SVG
/// @inherits Renderer
/// @aka L.SVG
///
/// Allows vector layers to be displayed with [SVG](https://developer.mozilla.org/docs/Web/SVG).
/// Inherits `Renderer`.
///
/// Due to [technical limitations](http://caniuse.com/#search=svg), SVG is not
/// available in all web browsers, notably Android 2.x and 3.x.
///
/// Although SVG is not available on IE7 and IE8, these browsers support
/// [VML](https://en.wikipedia.org/wiki/Vector_Markup_Language)
/// (a now deprecated technology), and the SVG renderer will fall back to VML in
/// this case.
///
/// @example
///
/// Use SVG by default for all paths in the map:
///
/// ```js
/// var map = L.map('map', {
/// 	renderer: L.svg();
/// });
/// ```
///
/// Use a SVG renderer with extra padding for specific vector geometries:
///
/// ```js
/// var map = L.map('map');
/// var myRenderer = L.svg({ padding: 0.5 });
/// var line = L.polyline( coordinates, { renderer: myRenderer } );
/// var circle = L.circle( center, { renderer: myRenderer } );
/// ```
////

@JS('L.svg')
class SVG extends Renderer {
  ///  constructor
  external SVG([RendererOptions options]);

  external dynamic getEvents();

  // @function pointsToPath(rings: Point[], closed: Boolean): String
  // Generates a SVG path string for multiple rings, with each ring turning
  // into "M..L..L.." instructions
  external static String pointsToPath(List<Point> rings, bool closed);
}
