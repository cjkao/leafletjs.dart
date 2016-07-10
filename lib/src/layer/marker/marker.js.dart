@JS()
library leafletjs.marker;

import '../../map.dart' as L;
import '../../lat.lng.dart';
import 'dart:html' as html;
import 'package:js/js.dart';
import 'icon.js.dart';
import '../layer.dart';

@JS('L.marker')
class Marker extends Layer {
  ///
  ///Instantiates a Marker object given a geographical point and optionally an options object.
  ///
  external Marker(LatLng latlng, [MarkerOptions options]);
  external dynamic onAdd(L.Map map);

  external dynamic onRemove(L.Map map);

  external dynamic getEvents();

  /// @method getLatLng: LatLng
  /// Returns the current geographical position of the marker.
  external LatLng getLatLng();

  /// @method setLatLng(latlng: LatLng): this
  /// Changes the marker position to the given point.
  external Marker setLatLng(LatLng latlng);

  /// @method setZIndexOffset(offset: Number): this
  /// Changes the [zIndex offset](#marker-zindexoffset) of the marker.
  external Marker setZIndexOffset(num offset);

  /// @method setIcon(icon: Icon): this
  /// Changes the marker icon.
  external Marker setIcon(Icon icon);

  external dynamic getElement();

  external dynamic update();

  /// @method setOpacity(opacity: Number): this
  /// Changes the opacity of the marker.
  external Marker setOpacity(num opacity);
  external Object toGeoJSON();
}

@JS()
@anonymous
class MarkerOptions {
  /// 1. @option icon: Icon = *
  /// 1. Icon class to use for rendering the marker. See [Icon documentation](#L.Icon) for details on how to customize the marker icon. Set to new `L.Icon.Default()` by default.
  /// 1. default [icon] : new L.Icon.Default()
  external Icon get icon;
  external void set icon(Icon _);

  ///
  /// Option inherited from "Interactive layer" abstract class
  /// default [interactive] : true
  ///
  external bool get interactive;
  external void set interactive(bool _);

  external bool get draggable;

  ///
  ///  @option draggable: Boolean = false
  /// Whether the marker is draggable with mouse/touch or not.
  /// default [draggable] : false
  ///
  external void set draggable(bool _);

  /// @option keyboard: Boolean = true
  /// Whether the marker can be tabbed to with a keyboard and clicked by pressing enter.
  /// default [keyboard] : true
  external bool get keyboard;
  external void set keyboard(bool _);

  /// @option title: String = ''
  /// Text for the browser tooltip that appear on marker hover (no tooltip by default).
  /// default [title] : ''
  external String get title;
  external void set title(String _);

  /// @option alt: String = ''
  /// Text for the `alt` attribute of the icon image (useful for accessibility).
  /// default [alt] : ''
  external String get alt;
  external void set alt(String _);

  /// @option zIndexOffset: Number = 0
  /// By default, marker images zIndex is set automatically based on its latitude. Use this option if you want to put the marker on top of all others (or below), specifying a high value like `1000` (or high negative value, respectively).
  /// default [zIndexOffset] : 0
  external String get zIndexOffset;
  external void set zIndexOffset(String _);

  /// @option opacity: Number = 1.0
  /// The opacity of the marker.
  /// default [opacity] : 1
  external String get opacity;
  external void set opacity(String _);

  /// @option riseOnHover: Boolean = false
  /// If `true`, the marker will get on top of others when you hover the mouse over it.
  /// default [riseOnHover] : false
  external bool get riseOnHover;
  external void set riseOnHover(bool _);

  /// @option riseOffset: Number = 250
  /// The z-index offset used for the `riseOnHover` feature.
  /// default [riseOffset] : 250
  external String get riseOffset;
  external void set riseOffset(String _);

  /// @option pane: String = 'markerPane'
  /// `Map pane` where the markers icon will be added.
  /// default [pane] : 'markerPane'
  external String get pane;
  external void set pane(String _);

  /// FIXME: shadowPane is no longer a valid option
  /// default [nonBubblingEvents] : ['click', 'dblclick', 'mouseover', 'mouseout', 'contextmenu']
  external List<String> get nonBubblingEvents;
  external void set nonBubblingEvents(List<String> _);

  external factory MarkerOptions(
      {Icon icon,
      bool interactive,
      bool draggable,
      bool keyboard,
      String title,
      String alt,
      String zIndexOffset,
      String opacity,
      bool riseOnHover,
      String riseOffset,
      String pane,
      List<String> nonBubblingEvents});
}
