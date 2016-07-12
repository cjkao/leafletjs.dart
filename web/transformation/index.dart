@JS()
library mymain;

//import 'dart:math' hide Rectangle;
import 'dart:html' hide Rectangle;
import 'dart:async';
import 'package:js/js.dart';
import 'package:leafletjs/leafletjs.dart' as L;

import 'dart:js';
import 'package:leafletjs/leafletjs.layer.dart';
import 'package:leafletjs/leafletjs.control.dart';
import 'package:leafletjs/leafletjs.dom.dart';
import 'package:leafletjs/leafletjs.geo.dart';
import 'dart:async';
import 'dart:convert';

main() async {
  var transformation = new Transformation(2, 5, -1, 10);
  var p = new L.Point(1, 2);
  p.clone();
  var p2 = transformation.transform(p, 2); //  L.point(7, 8)
  var p3 = transformation.untransform(p2); //  L.point(1, 2)
}
