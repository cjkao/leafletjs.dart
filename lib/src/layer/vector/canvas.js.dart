@JS('')
library leafletjs.canvas;

import 'package:js/js.dart';

import 'renderer.js.dart';

////
/// @class Canvas
/// @inherits Renderer
/// @aka L.Canvas
///
/// Allows vector layers to be displayed with [`<canvas>`](https://developer.mozilla.org/docs/Web/API/Canvas_API).
/// Inherits `Renderer`.
///
/// Due to [technical limitations](http://caniuse.com/#search=canvas), Canvas is not
/// available in all web browsers, notably IE8, and overlapping geometries might
/// not display properly in some edge cases.
///
/// @example
///
/// Use Canvas by default for all paths in the map:
///
/// ```js
/// var map = L.map('map', {
/// 	renderer: L.canvas();
/// });
/// ```
///
/// Use a Canvas renderer with extra padding for specific vector geometries:
///
/// ```js
/// var map = L.map('map');
/// var myRenderer = L.canvas({ padding: 0.5 });
/// var line = L.polyline( coordinates, { renderer: myRenderer } );
/// var circle = L.circle( center, { renderer: myRenderer } );
/// ```
////
@JS('L.canvas')
class Canvas extends Renderer {
  ///  constructor
  external Canvas([RendererOptions options]);

  external void onAdd();
}
