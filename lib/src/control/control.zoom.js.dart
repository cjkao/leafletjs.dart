@JS('')
library leafletjs.controlzoom;

import '../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import 'control.js.dart';

////
/// @class Control.Zoom
/// @aka L.Control.Zoom
/// @inherits Control
///
/// A basic zoom control with two buttons (zoom in and zoom out). It is put on the map by default unless you set its [`zoomControl` option](#map-zoomcontrol) to `false`. Extends `Control`.
////
@JS('L.control.zoom')
class Zoom extends Control {
  ///  constructor
  external Zoom([ZoomOptions options]);

  external html.Element onAdd(L.Map map);

  external onRemove(L.Map map);

  external Zoom disable();

  external Zoom enable();
  external ZoomOptions get options;
}

@JS()
@anonymous
class ZoomOptions extends ControlOptions {
  /// default [position] : 'topleft'
//  external String get position;
//  external void set position(String _);

  /// default [zoomInText] : '+'
  external String get zoomInText;
  external void set zoomInText(String _);

  /// default [zoomInTitle] : 'Zoom in'
  external String get zoomInTitle;
  external void set zoomInTitle(String _);

  /// default [zoomOutText] : '-'
  external String get zoomOutText;
  external void set zoomOutText(String _);

  /// default [zoomOutTitle] : 'Zoom out'
  external String get zoomOutTitle;
  external void set zoomOutTitle(String _);

  external factory ZoomOptions(
      {String position, String zoomInText, String zoomInTitle, String zoomOutText, String zoomOutTitle});
}
