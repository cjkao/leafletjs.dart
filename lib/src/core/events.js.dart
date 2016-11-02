@JS('')
library leafletjs.evented;

import 'dart:html' as html;
import 'package:js/js.dart';
import 'class.dart';
import '../geometry/point.dart';
import '../lat.lng.dart';

/// A set of methods shared between event-powered classes (like Map and Marker).
/// Generally, events allow you to execute some function when something happens
/// with an object (e.g. the user clicks on the map, causing the map to fire
/// 'click' event).
@anonymous
@JS()
abstract class Evented {
  /// Adds a listener function (fn) to a particular event type of the object.
  /// You can optionally specify the context of the listener (object the this
  /// keyword will point to). You can also pass several space-separated types
  /// (e.g. 'click dblclick').
  /*external Evented on(String type, EventHandlerFn fn, [Object context]);*/
  /// Adds a set of type/listener pairs, e.g. {click: onClick, mousemove: onMouseMove}
  /*external Evented on(EventHandlerFnMap eventMap);*/
  external Evented on(String type_eventMap, [fn, Object context]);

  /// Removes a previously added listener function. If no function is specified,
  /// it will remove all the listeners of that particular event from the object.
  /// Note that if you passed a custom context to on, you must pass the same context
  /// to off in order to remove the listener.
  /*external Evented off(String type, [EventHandlerFn fn, Object context]);*/
  /// Removes a set of type/listener pairs.
  /*external Evented off(EventHandlerFnMap eventMap);*/
  /// Removes all listeners to all events on the object.
  /*external Evented off();*/
  external Evented off([String type_eventMap, fn, Object context]);

  /// Fires an event of the specified type. You can optionally provide a data
  /// object — the first argument of the listener function will contain its properties.
  /// The event might can optionally be propagated to event parents.
  external Evented fire(String type, [Object data, bool propagate]);

  /// Returns true if a particular event type has any listeners attached to it.
  external bool listens(String type);

  /// Behaves as on(...), except the listener will only get fired once and then removed.
  /*external Evented once(String type, EventHandlerFn fn, [Object context]);*/
  /// Behaves as on(...), except the listener will only get fired once and then removed.
  /*external Evented once(EventHandlerFnMap eventMap);*/
  external Evented once(String type_eventMap, [fn, Object context]);

  /// Adds an event parent - an Evented that will receive propagated events
  external Evented addEventParent(Evented obj);

  /// Removes an event parent, so it will stop receiving propagated events
  external Evented removeEventParent(Evented obj);

  /// Alias for on(...)
  /// Adds a listener function (fn) to a particular event type of the object.
  /// You can optionally specify the context of the listener (object the this
  /// keyword will point to). You can also pass several space-separated types
  /// (e.g. 'click dblclick').
  /*external Evented addEventListener(String type, EventHandlerFn fn,
    [Object context]);*/
  /// Alias for on(...)
  /// Adds a set of type/listener pairs, e.g. {click: onClick, mousemove: onMouseMove}
  /*external Evented addEventListener(EventHandlerFnMap eventMap);*/
  external Evented addEventListener(String type_eventMap, [fn, Object context]);

  /// Alias for off(...)
  /// Removes a previously added listener function. If no function is specified,
  /// it will remove all the listeners of that particular event from the object.
  /// Note that if you passed a custom context to on, you must pass the same context
  /// to off in order to remove the listener.
  /*external Evented removeEventListener(String type, EventHandlerFn fn,
    [Object context]);*/
  /// Alias for off(...)
  /// Removes a set of type/listener pairs.
  /*external Evented removeEventListener(EventHandlerFnMap eventMap);*/
  external Evented removeEventListener(String type_eventMap, [fn, Object context]);

  /// Alias for off()
  /// Removes all listeners to all events on the object.
  external Evented clearAllEventListeners();

  /// Alias for once(...)
  /// Behaves as on(...), except the listener will only get fired once and then removed.
  /*external Evented addOneTimeEventListener(String type, EventHandlerFn fn,
    [Object context]);*/
  /// Alias for once(...)
  /// Behaves as on(...), except the listener will only get fired once and then removed.
  /*external Evented addOneTimeEventListener(EventHandlerFnMap eventMap);*/
  external Evented addOneTimeEventListener(String type_eventMap, [fn, Object context]);

  /// Alias for fire(...)
  /// Fires an event of the specified type. You can optionally provide a data
  /// object — the first argument of the listener function will contain its properties.
  /// The event might can optionally be propagated to event parents.
  external Evented fireEvent(String type, [Object data, bool propagate]);

  /// Alias for listens(...)
  /// Returns true if a particular event type has any listeners attached to it.
  external bool hasEventListeners(String type);
}

@JS()
@anonymous
class Event {
  Point containerPoint;
  LatLng latlng;
  Point layerPoint;
  html.MouseEvent originalEvent;

  /// event type, e.g: click
  String type;
}

class Evt {
  static const String CLICK = 'click';
}
