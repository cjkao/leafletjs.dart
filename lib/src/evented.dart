@JS()
library leafletjs.event;

import 'dart:html' as html;
import "package:js/js.dart";
import 'point.dart';
import 'lat.lng.dart';
import 'package:func/func.dart';
class Evt{
   static const String CLICK='click';
}
@JS()
abstract class IEvented {
  external on(String type, Func1<Event, dynamic> fn, [Object context]);
  external off(String type, Function fn, [Object context]);
  // Fires an event of the specified type. You can optionally provide an data
  // object — the first argument of the listener function will contain its
  external fire(String type, [data, bool propagate]);
  // @method listens(type: String): Boolean
  // Returns `true` if a particular event type has any listeners attached to it.
  external listens (String type,[bool propagate]) ;

  // @method once(…): this
  // Behaves as [`on(…)`](#evented-on), except the listener will only get fired once and then removed.
  external once (String types, Func1<Event,dynamic> fn,[ context]) ;
  external addEventParent(IEvented obj);
  external removeEventParent(IEvented obj);


  
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
