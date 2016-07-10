@JS('')
library leafletjs.renderer;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import '../layer.dart';
////
/// @class Renderer
/// @inherits Layer
/// @aka L.Renderer
///
/// Base class for vector renderer implementations (`SVG`, `Canvas`). Handles the
/// DOM container of the renderer, its bounds, and its zoom animation.
///
/// A `Renderer` works as an implicit layer group for all `Path`s - the renderer
/// itself can be added or removed to the map. All paths use a renderer, which can
/// be implicit (the map will decide the type of renderer and use it automatically)
/// or explicit (using the [`renderer`](#path-renderer) option of the path).
///
/// Do not use this class directly, use `SVG` and `Canvas` instead.
///
////

@JS('L.renderer')
class Renderer extends Layer {
  ///  constructor
  external Renderer([options]);

  external void onAdd();

  external void onRemove();

  external Map getEvents();
}

@JS()
@anonymous
class RendererOptions {
  /// default [padding] : 0.1
  external num get padding;
  external void set padding(num _);

  external factory RendererOptions({num padding});
}
