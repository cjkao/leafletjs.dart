@JS()
library leafletjs.minimap;

import 'package:leafletjs/leafletjs.dart' as L;
import 'package:leafletjs/leafletjs.layer.dart';
import 'package:js/js.dart';

@JS('L.control.minimap')
class Minimap {
  ///  constructor
  external Minimap(layer, [MinimapOptions options]);
  external onAdd(L.Map map);

  external Minimap addTo(L.Map map);
  external onRemove(L.Map map);
  external void changeLayer(Layer layer);
}

@JS()
@anonymous
class MinimapOptions {
  external factory MinimapOptions(
      {String position, //: 'bottomright',
      bool toggleDisplay, //: false,
      int zoomLevelOffset, //: -5,
      bool zoomLevelFixed, //: false,
      bool centerFixed, //: false,
      bool zoomAnimation, //: false,
      bool autoToggleDisplay, //,: false,
      bool minimized, //: false,
      int width, //: 150,
      int height, //: 150,
      int collapsedWidth, //: 19,
      int collapsedHeight //: 19,
      //  aimingRectOptions: {color: '#ff7800', weight: 1, clickable: false},
      //  shadowRectOptions: {color: '#000000', weight: 1, clickable: false, opacity: 0, fillOpacity: 0},
      //  strings: {hideText: 'Hide MiniMap', showText: 'Show MiniMap'},

      });
}
