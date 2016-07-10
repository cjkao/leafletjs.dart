@JS('')
library leafletjs.popup;

import '../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import '../lat.lng.dart';

////
/// @namespace Layer
/// @section Popup methods example
///
/// All layers share a set of methods convenient for binding popups to it.
///
/// ```js
/// var layer = L.Polygon(latlngs).bindPopup('Hi There!').addTo(map);
/// layer.openPopup();
/// layer.closePopup();
/// ```
///
/// Popups will also be automatically opened when the layer is clicked on and closed when the layer is removed from the map or another popup is opened.
////
