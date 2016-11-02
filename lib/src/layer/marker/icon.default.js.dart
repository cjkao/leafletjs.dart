@JS()
library leafletjs.marker.icon.def;

import 'package:js/js.dart';
import 'icon.js.dart';

//@JS('L.Icon.Default.prototype.options')
//external IconOptions getIconDefault();
@JS("L.Icon.Default.prototype.options")
external IconOptions get IconDefault;
