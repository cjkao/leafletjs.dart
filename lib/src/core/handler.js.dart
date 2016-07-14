@JS('')
library leafletjs.handler;

import '../map.dart' as L;
import 'package:js/js.dart';
import 'class.dart';

@JS('L.handler')
class Handler extends IClass {
  ///  constructor
  external Handler([L.Map map]);

  /// @method enable(): this
  /// Enables the handler
  external Handler enable();

  /// @method disable(): this
  /// Disables the handler
  external Handler disable();

  /// @method enabled(): Boolean
  /// Returns `true` if the handler is enabled
  external bool enabled();
}
