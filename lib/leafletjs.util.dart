@JS()
library leafletjs.util;

import 'dart:math';
import 'src/lat.lng.dart';
import 'package:js/js.dart';

abstract class PolylineUtil {
  ///
  /// Encodes points to a string with given options
  ///
  static String encode(List<LatLng> points, [CodeOptions options]) {
    if (points.isEmpty) {
      return '';
    }
    if (options == null) {
      options = new CodeOptions();
    }

    var output = _encode(points[0].lat, 0.0, options.factor) + _encode(points[0].lng, 0.0, options.factor);
    for (int i = 1; i < points.length; i++) {
      LatLng a = points[i];
      LatLng b = points[i - 1];
      output += _encode(a.lat, b.lat, options.factor);
      output += _encode(a.lng, b.lng, options.factor);
    }
    return output;
  }

  static _encode(double currentPrecise, double previousPrecise, num factor) {
    int current = (currentPrecise * factor).round();
    int previous = (previousPrecise * factor).round();
    var coordinate = current - previous;
    coordinate <<= 1;
    if (current - previous < 0) {
      coordinate = ~coordinate;
    }
    var output = '';
    while (coordinate >= 0x20) {
      output += new String.fromCharCode((0x20 | (coordinate & 0x1f)) + 63);
      coordinate >>= 5;
    }
    output += new String.fromCharCode(coordinate + 63);
    return output;
  }

  ///
  /// Decodes to a [List<LatLng>] coordinates array.
  /// This is adapted from the implementation in Project-OSRM.
  ///
  static List<LatLng> decode(String str, [CodeOptions options]) {
    if (options == null) {
      options = new CodeOptions();
    }
    List<LatLng> coordinates = [];
    int index = 0, lat = 0, lng = 0, shift = 0, result = 0, byte = null, latitude_change, longitude_change;

    // Coordinates have variable length when encoded, so just keep
    // track of whether we've hit the end of the string. In each
    // loop iteration, a single coordinate is decoded.
    while (index < str.length) {
      // Reset shift, result, and byte
      byte = null;
      shift = 0;
      result = 0;

      do {
        byte = str.codeUnitAt(index++) - 63;
        result |= ((byte & 0x1f) << shift);
        shift += 5;
      } while (byte >= 0x20);

      latitude_change = calcDiff(result);

      shift = 0;
      result = 0;

      do {
        byte = str.codeUnitAt(index++) - 63;
        result |= ((byte & 0x1f) << shift);
        shift += 5;
      } while (byte >= 0x20);

      longitude_change = calcDiff(result);

      lat += latitude_change;
      lng += longitude_change;

      coordinates.add(new LatLng(lat / options.factor, lng / options.factor));
    }

    return coordinates;
  }

  static int calcDiff(int result) {
    bool isZero = (result & 1) == 0;
    int val = (result >> 1);
    if (isZero) {
      return val;
    } else {
      return -val - 1; //should be ~val, but due to https://github.com/dart-lang/sdk/issues/25493
    }
  }
}

class CodeOptions {
  num precision;
  num factor;

  CodeOptions([this.precision = 5, this.factor]) {
    if (this.factor == null) {
      this.factor = pow(10, precision);
    }
  }
}

////

@JS('JSON.parse')
external JSONparse(_);

@JS()
@anonymous
class DynamicSource {}

@JS()
@anonymous
class DynamicDescription {
  external get value;

  external factory DynamicDescription({bool configurable, bool enumerable, bool writable, value});
}

// Interop to ES5+ functions that will allow us to get/set arbitrary properties on
// anonymous javascript objects.
@JS('Object.defineProperty')
external void defineProperty(object, String property, DynamicDescription description);

@JS('Object.getOwnPropertyDescriptor')
external DynamicDescription getOwnPropertyDescriptor(object, String property);

// A helper class for dealing with proxying anonymous JS objects that are to be
// used as maps and therefore do not have a fixed structure that can be defined
// ahead of time.
class Dynamic<T> {
  DynamicSource source;

  Dynamic([this.source]) {
    source ??= JSONparse('{}');
  }
  Dynamic.fromMap(Map m) {
    source ??= JSONparse('{}');
    m.forEach((key, value) {
      if (value is Function) {
        this[key] = allowInterop(value);
      } else if (value is Map) {
        this[key] = new Dynamic.fromMap(value);
      } else {
        this[key] = value;
      }
    });
  }
  T operator [](String key) {
    return getOwnPropertyDescriptor(this.source, key)?.value;
  }

  operator []=(String key, value) {
    defineProperty(
        this.source, key, new DynamicDescription(value: value, writable: true, enumerable: true, configurable: true));

    return value;
  }
}

/// A workaround to converting an object from JS to a Dart Map.
// Map jsToMap(jsObject) {
//   return new Map.fromIterable(
//     _getKeysOfObject(jsObject),
//     value: (key) => getProperty(jsObject, key),
//   );
// }

// Both of these interfaces exist to call `Object.keys` from Dart.
//
// But you don't use them directly. Just see `jsToMap`.
// @JS('Object.keys')
// external List<String> _getKeysOfObject(jsObject);
