@JS('')
library leafletjs.evented;

import 'dart:html' as html;
import 'package:js/js.dart';
import 'class.dart';

@JS('L.evented')
class Evented extends IClass {
  ///  constructor
  external Evented();

  external Evented on(String type, Function fn, [Object context]);

  external Evented off(String type, [Function fn, Object context]);

  /// @method fire(type: String, data?: Object, propagate?: Boolean): this
  /// Fires an event of the specified type. You can optionally provide an data
  /// object — the first argument of the listener function will contain its
  /// properties. The event might can optionally be propagated to event parents.
  external Evented fire(String type, [Object data, bool propagate]);

  /// @method listens(type: String): Boolean
  /// Returns `true` if a particular event type has any listeners attached to it.
  external bool listens(String type);

  /// @method once(…): this
  /// Behaves as [`on(…)`](#evented-on), except the listener will only get fired once and then removed.
  external Evented once();

  /// @method addEventParent(obj: Evented): this
  /// Adds an event parent - an `Evented` that will receive propagated events
  external Evented addEventParent(Evented obj);

  /// @method removeEventParent(obj: Evented): this
  /// Removes an event parent, so it will stop receiving propagated events
  external Evented removeEventParent(Evented obj);
}
