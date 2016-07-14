@JS()
library leafletjs.map;

import 'dart:html' as html;
import 'geo/crs/crs.dart' as crs;
import "package:js/js.dart";
import 'lat.lng.bounds.dart';
import 'lat.lng.dart';
import 'geometry/point.dart';
import 'core/events.js.dart';
import 'geometry/bounds.dart';
import '../leafletjs.control.dart';
import '../leafletjs.map.dart';
import '../leafletjs.layer.dart';

@JS("L.Map")
class Map extends Evented with IMapLayer {
  external Map(String id, [MapOptions options]);
  external MapOptions get options;
  // @method setView(center: LatLnt, zoom: Number, options?: Zoom/Pan options): this
  // Sets the view of the map (geographical center and zoom) with the given
  // animation options.
  external Map setView(LatLng center, num zoom, [ZoomPanOptions zpOpt]);

  // @method setZoom(zoom: Number, options: Zoom/Pan options): this
  // Sets the zoom of the map.
  external Map setZoom(num zoom, [ZoomPanOptions options]);

  // @method zoomIn(delta?: Number, options?: Zoom options): this
  // Increases the zoom of the map by `delta` ([`zoomDelta`](#map-zoomdelta) by default).
  external Map zoomIn([num delta, ZoomOptions options]);

  // @method zoomOut(delta?: Number, options?: Zoom options): this
  // Decreases the zoom of the map by `delta` ([`zoomDelta`](#map-zoomdelta) by default).
  external zoomOut([num delta, ZoomOptions options]);

  // @method setZoomAround(latlng: LatLng, zoom: Number, options: Zoom options): this
  // Zooms the map while keeping a specified geographical point on the map
  // stationary (e.g. used internally for scroll zoom and double-click zoom).
  // @alternative
  // @method setZoomAround(offset: Point, zoom: Number, options: Zoom options): this
  // Zooms the map while keeping a specified pixel on the map (relative to the top-left corner) stationary.
  external Map setZoomAround(LatLng latlng, num zoom, ZoomOptions options);

  ///
  ///Sets a map view that contains the given geographical bounds with the maximum zoom level possible.
  ///
  external Map fitBounds(LatLngBounds bounds, [FitBoundsOptions options]);

  // @method fitWorld(options?: fitBounds options): this
  // Sets a map view that mostly contains the whole world with the maximum
  // zoom level possible.
  external Map fitWorld([FitBoundsOptions options]);
  // @method panTo(latlng: LatLng, options?: Pan options): this
  // Pans the map to a given center.
  external Map panTo(LatLng center, [PanOptions options]); // (LatLng)

  // @method panBy(offset: Point): this
  // Pans the map by a given number of pixels (animated).
  external Map panBy(Point offset); // (Point)

  // @method setMaxBounds(bounds: Bounds): this
  // Restricts the map view to the given bounds (see the [maxBounds](#map-maxbounds) option).
  external Map setMaxBounds(Bounds bounds);

  // @method setMinZoom(zoom: Number): this
  // Sets the lower limit for the available zoom levels (see the [minZoom](#map-minzoom) option).
  external Map setMinZoom(num zoom);

  // @method setMaxZoom(zoom: Number): this
  // Sets the upper limit for the available zoom levels (see the [maxZoom](#map-maxzoom) option).
  external Map setMaxZoom(num zoom);

  // @method invalidateSize(options: Zoom/Pan options): this
  // Checks if the map container size changed and updates the map if so —
  // call it after you've changed the map size dynamically, also animating
  // pan by default. If `options.pan` is `false`, panning will not occur.
  // If `options.debounceMoveend` is `true`, it will delay `moveend` event so
  // that it doesn't happen often even if the method is called many
  // times in a row.

  // @alternative
  // @method invalidateSize(animate: Boolean): this
  // Checks if the map container size changed and updates the map if so —
  // call it after you've changed the map size dynamically, also animating
  // pan by default.
  external Map invalidateSize(ZoomPanOptions options);
  // @section Methods for modifying map state
  // @method stop(): this
  // Stops the currently running `panTo` or `flyTo` animation, if any.
  external Map stop();

  // TODO handler.addTo
  // TODO Appropiate docs section?
  // @section Other Methods
  // @method addHandler(name: String, HandlerClass: Function): this
  // Adds a new `Handler` to the map, given its name and constructor function.
  external Map addHandler(String name, Function HandlerClass);

  // @method remove(): this
  // Destroys the map and clears all related event listeners.
  external Map remove();

  // @section Other Methods
  // @method createPane(name: String, container?: HTMLElement): HTMLElement
  // Creates a new map pane with the given name if it doesn't exist already,
  // then returns it. The pane is created as a children of `container`, or
  // as a children of the main map pane if not set.
  external Map createPane(String name, html.Element container);

  // @section Methods for Getting Map State

  // @method getCenter(): LatLng
  // Returns the geographical center of the map view
  external LatLng getCenter();

  // @method getZoom(): Number
  // Returns the current zoom level of the map view
  external num getZoom();

  // @method getBounds(): LatLngBounds
  // Returns the geographical bounds visible in the current map view
  external LatLngBounds getBounds();

  // @method getMinZoom(): Number
  // Returns the minimum zoom level of the map (if set in the `minZoom` option of the map or of any layers), or `0` by default.
  external num getMinZoom();

  // @method getMaxZoom(): Number
  // Returns the maximum zoom level of the map (if set in the `maxZoom` option of the map or of any layers).
  external num getMaxZoom();

  // @method getBoundsZoom(bounds: LatLngBounds, inside?: Boolean): Number
  // Returns the maximum zoom level on which the given bounds fit to the map
  // view in its entirety. If `inside` (optional) is set to `true`, the method
  // instead returns the minimum zoom level on which the map view fits into
  // the given bounds in its entirety.
  external num getBoundsZoom(LatLngBounds bounds, [bool inside, padding]); // (LatLngBounds[, Boolean, Point]) -> Number

  // @method getSize(): Point
  // Returns the current size of the map container (in pixels).
  external Point getSize();
  // @method getPixelBounds(): Bounds
  // Returns the bounds of the current map view in projected pixel
  // coordinates (sometimes useful in layer and overlay implementations).
  external Bounds getPixelBounds(center, num zoom);

  // TODO: Check semantics - isn't the pixel origin the 0,0 coord relative to
  // the map pane? "left point of the map layer" can be confusing, specially
  // since there can be negative offsets.
  // @method getPixelOrigin(): Point
  // Returns the projected pixel coordinates of the top left point of
  // the map layer (useful in custom layer and overlay implementations).
  external Point getPixelOrigin();

  // @method getPixelWorldBounds(zoom?: Number): Bounds
  // Returns the world's bounds in pixel coordinates for zoom level `zoom`.
  // If `zoom` is omitted, the map's current zoom level is used.
  external Bounds getPixelWorldBounds([num zoom]);

  // @section Other Methods

  // @method getPane(pane: String|HTMLElement): HTMLElement
  // Returns a map pane, given its name or its HTML element (its identity).
  external html.Element getPane(pane);

  // @method getPanes(): Object
  // Returns a plain object containing the names of all panes as keys and
  // the panes as values.
  external getPanes();

  // @method getContainer: HTMLElement
  // Returns the HTML element that contains the map.
  external html.Element getContainer();

  // @section Conversion Methods

  // @method getZoomScale(toZoom: Number, fromZoom: Number): Number
  // Returns the scale factor to be applied to a map transition from zoom level
  // `fromZoom` to `toZoom`. Used internally to help with zoom animations.
  external num getZoomScale(num toZoom, num fromZoom);

  // @method getScaleZoom(scale: Number, fromZoom: Number): Number
  // Returns the zoom level that the map would end up at, if it is at `fromZoom`
  // level and everything is scaled by a factor of `scale`. Inverse of
  // [`getZoomScale`](#map-getZoomScale).
  external num getScaleZoom(num scale, num fromZoom);

  // @method project(latlng: LatLng, zoom: Number): Point
  // Projects a geographical coordinate `LatLng` according to the projection
  // of the map's CRS, then scales it according to `zoom` and the CRS's
  // `Transformation`. The result is pixel coordinate relative to
  // the CRS origin.
  external Point project(LatLng latlng, num zoom);

  // @method unproject(point: Point, zoom: Number): LatLng
  // Inverse of [`project`](#map-project).
  external LatLng unproject(Point point, num zoom);

  // @method layerPointToLatLng(point: Point): LatLng
  // Given a pixel coordinate relative to the [origin pixel](#map-getpixelorigin),
  // returns the corresponding geographical coordinate (for the current zoom level).
  external LatLng layerPointToLatLng(Point point);

  // @method latLngToLayerPoint(latlng: LatLng): Point
  // Given a geographical coordinate, returns the corresponding pixel coordinate
  // relative to the [origin pixel](#map-getpixelorigin).
  external Point latLngToLayerPoint(LatLng latlng);

  // @method wrapLatLng(latlng: LatLng): LatLng
  // Returns a `LatLng` where `lat` and `lng` has been wrapped according to the
  // map's CRS's `wrapLat` and `wrapLng` properties, if they are outside the
  // CRS's bounds.
  // By default this means longitude is wrapped around the dateline so its
  // value is between -180 and +180 degrees.
  external LatLng wrapLatLng(LatLng latlng);

  // @method distance(latlng1: LatLng, latlng2: LatLng): Number
  // Returns the distance between two geographical coordinates according to
  // the map's CRS. By default this measures distance in meters.
  external num distance(LatLng latlng1, LatLng latlng2);

  // @method containerPointToLayerPoint(point: Point): Point
  // Given a pixel coordinate relative to the map container, returns the corresponding
  // pixel coordinate relative to the [origin pixel](#map-getpixelorigin).
  external Point containerPointToLayerPoint(Point point); // (Point)

  // @method layerPointToContainerPoint(point: Point): Point
  // Given a pixel coordinate relative to the [origin pixel](#map-getpixelorigin),
  // returns the corresponding pixel coordinate relative to the map container.
  external Point layerPointToContainerPoint(Point point); // (Point)

  // @method containerPointToLatLng(point: Point): Point
  // Given a pixel coordinate relative to the map container, returns
  // the corresponding geographical coordinate (for the current zoom level).
  external Point containerPointToLatLng(Point point);

  // @method latLngToContainerPoint(latlng: LatLng): Point
  // Given a geographical coordinate, returns the corresponding pixel coordinate
  // relative to the map container.
  external Point latLngToContainerPoint(LatLng latlng);

  // @method mouseEventToContainerPoint(ev: MouseEvent): Point
  // Given a MouseEvent object, returns the pixel coordinate relative to the
  // map container where the event took place.
  external Point mouseEventToContainerPoint(html.MouseEvent e);

  // @method mouseEventToLayerPoint(ev: MouseEvent): Point
  // Given a MouseEvent object, returns the pixel coordinate relative to
  // the [origin pixel](#map-getpixelorigin) where the event took place.
  external Point mouseEventToLayerPoint(html.MouseEvent e);

  // @method mouseEventToLatLng(ev: MouseEvent): LatLng
  // Given a MouseEvent object, returns geographical coordinate where the
  // event took place.
  external LatLng mouseEventToLatLng(html.MouseEvent e); // (MouseEvent)

  // @method whenReady(fn: Function, context?: Object): this
  // Runs the given function `fn` when the map gets initialized with
  // a view (center and zoom) and at least one layer, or immediately
  // if it's already initialized, optionally passing a function context.
  external Map whenReady(Function callback, [context]);

  ///
  ///Pans the map to the closest view that would lie inside the given bounds (if it's not already), controlling the animation using the options specific, if any.
  ///
  external Map panInsideBounds(LatLngBounds bounds, [PanOptions options]);

  ///
  /// Control area
  // @method addControl(control: Control): this
  // Adds the given control to the map
  external Map addControl(Control control);

  ///
  /// only exist when zoomControl is on
  ///
  external Zoom get zoomControl;

  /// Box (shift-drag with mouse) zoom handler.
  external MapBoxZoom get boxZoom;

  //
  /// @method flyTo(latlng: LatLng, zoom?: Number, options?: Zoom/Pan options): this
  /// Sets the view of the map (geographical center and zoom) performing a smooth
  /// pan-zoom animation.
  external Map flyTo(LatLng latlng, [num zoom, ZoomPanOptions options]);

  /// @method flyToBounds(bounds: LatLngBounds, options?: fitBounds options): this
  /// Sets the view of the map with a smooth animation like [`flyTo`](#map-flyto),
  /// but takes a bounds parameter like [`fitBounds`](#map-fitbounds).
  external Map flyToBounds(LatLngBounds bounds, [options]);

  external Attribution get attributionControl;
}

@JS()
@anonymous
class MapOptions {
  external crs.ICRS get crs;
  external void set crs(_);
  external LatLng get center;
  external void set center(_);
  external num get zoom;
  external void set zoom(_);
  external List<Layer> get layers;
  external num get minZoom;
  external void set minZoom(_);
  external num get maxZoom;
  external void set maxZoom(_);

  // @option maxBounds: LatLngBounds = null
  // When this option is set, the map restricts the view to the given
  // geographical bounds, bouncing the user back when he tries to pan
  // outside the view. To set the restriction dynamically, use
  // [`setMaxBounds`](#map-setmaxbounds) method.
  external LatLngBounds get maxBounds;
  external void set maxBounds(_);

  // @option renderer: Renderer = *
  // The default method for drawing vector layers on the map. `L.SVG`
  // or `L.Canvas` by default depending on browser support.
  external Renderer get renderer;
  external void set renderer(Renderer _);

  // @section Animation Options
  // @option fadeAnimation: Boolean = true
  // Whether the tile fade animation is enabled. By default it's enabled
  // in all browsers that support CSS3 Transitions except Android.
  external bool get fadeAnimation;
  external void set fadeAnimation(_);

  // @option markerZoomAnimation: Boolean = true
  // Whether markers animate their zoom with the zoom animation, if disabled
  // they will disappear for the length of the animation. By default it's
  // enabled in all browsers that support CSS3 Transitions except Android.
  external bool get markerZoomAnimation;
  external void set markerZoomAnimation(_);

  // @option transform3DLimit: Number = 2^23
  // Defines the maximum size of a CSS translation transform. The default
  // value should not be changed unless a web browser positions layers in
  // the wrong place after doing a large `panBy`.
  external num get transform3DLimit; // Precision limit of a 32-bit float
  external void set transform3DLimit(_); // Precision limit of a 32-bit float

  // @section Interaction Options
  // @option zoomSnap: Number = 1
  // Forces the map's zoom level to always be a multiple of this, particularly
  // right after a [`fitBounds()`](#map-fitbounds) or a pinch-zoom.
  // By default, the zoom level snaps to the nearest integer; lower values
  // (e.g. `0.5` or `0.1`) allow for greater granularity. A value of `0`
  // means the zoom level will not be snapped after `fitBounds` or a pinch-zoom.
  external num get zoomSnap;
  external void set zoomSnap(_);

  // @option zoomDelta: Number = 1
  // Controls how much the map's zoom level will change after a
  // [`zoomIn()`](#map-zoomin), [`zoomOut()`](#map-zoomout), pressing `+`
  // or `-` on the keyboard, or using the [zoom controls](#control-zoom).
  // Values smaller than `1` (e.g. `0.5`) allow for greater granularity.
  external num get zoomDelta;
  external void set zoomDelta(_);

  // @option trackResize: Boolean = true
  // Whether the map automatically handles browser window resize to update itself.
  external bool get trackResize;
  external void set trackResize(_);

  /// Control area

  /// from zoom control
  external bool get zoomControl;
  external void set zoomControl(bool _);

  ///box zoom
  external bool get boxZoom;
  external void set boxZoom(bool _);
  // @option doubleClickZoom: Boolean|String = true
  // Whether the map can be zoomed in by double clicking on it and
  // zoomed out by double clicking while holding shift. If passed
  // `'center'`, double-click zoom will zoom to the center of the
  //  view regardless of where the mouse was.
  external bool get doubleClickZoom;
  external void set doubleClickZoom(bool _);

  /// @option dragging: Boolean = true
  /// Whether the map be draggable with mouse/touch or not.
  external bool get dragging;
  external void set dragging(bool _);

  /// @option keyboard: Boolean = true
  /// Makes the map focusable and allows users to navigate the map with keyboard
  /// arrows and `+`/`-` keys.
  external bool get keyboard; //: true,
  external void set keyboard(bool _);

  // @option keyboardPanDelta: Number = 80
  // Amount of pixels to pan when pressing an arrow key.
  external num get keyboardPanDelta; //h: 80
  external void set keyboardPanDelta(num _);

  // @section Mousewheel options
  // @option scrollWheelZoom: Boolean|String = true
  // Whether the map can be zoomed by using the mouse wheel. If passed `'center'`,
  // it will zoom to the center of the view regardless of where the mouse was.
  external bool get scrollWheelZoom; //: true,
  external void set scrollWheelZoom(bool _);
  // @option wheelDebounceTime: Number = 40
  // Limits the rate at which a wheel can fire (in milliseconds). By default
  // user can't zoom via wheel more often than once per 40 ms.
  external num get wheelDebounceTime; //: 40,
  external void set wheelDebounceTime(num _);
  // @option wheelPxPerZoomLevel: Number = 60
  // How many scroll pixels (as reported by [L.DomEvent.getWheelDelta](#domevent-getwheeldelta))
  // mean a change of one full zoom level. Smaller values will make wheel-zooming
  // faster (and vice versa).
  external num get wheelPxPerZoomLevel; //: 60
  external void set wheelPxPerZoomLevel(num _);

  // @section Touch interaction options
  // @option tap: Boolean = true
  // Enables mobile hacks for supporting instant taps (fixing 200ms click
  // delay on iOS/Android) and touch holds (fired as `contextmenu` events).
  external bool get tap; //: true,
  external void set tap(_);
  // @option tapTolerance: Number = 15
  // The max number of pixels a user can shift his finger during touch
  // for it to be considered a valid tap.
  external num get tapTolerance; //: 15
  external void set tapTolerance(_); //: 15
  // @option zoomAnimation: Boolean = true
  // Whether the map zoom animation is enabled. By default it's enabled
  // in all browsers that support CSS3 Transitions except Android.
  external bool get zoomAnimation; //: true,
  external void set zoomAnimation(bool _); //: true,

  // @option zoomAnimationThreshold: Number = 4
  // Won't animate zoom if the zoom difference exceeds this value.
  external num get zoomAnimationThreshold; //: 4
  external void set zoomAnimationThreshold(num _); //: 4
  external factory MapOptions(
      {crs,
      LatLng center,
      num zoom,
      List<Layer> layers,
      num minZoom,
      num maxZoom,
      LatLngBounds maxBounds,
      Renderer renderer,
      bool fadeAnimation,
      bool markerZoomAnimation,
      num transform3DLimit,
      num zoomSnap,
      num zoomDelta,
      bool trackResize,
      bool zoomControl,
      bool boxZoom,
      bool doubleClickZoom,
      bool dragging,
      bool keyboard,
      num keyboardPanDelta,
      bool scrollWheelZoom,
      num wheelDebounceTime,
      num wheelPxPerZoomLevel,
      bool tap,
      num tapTolerance,
      bool zoomAnimation,
      num zoomAnimationThreshold});
}

class ZoomOptions {
  external factory ZoomOptions({bool animate});
}

@JS()
@anonymous
class ZoomPanOptions {
  external factory ZoomPanOptions({bool reset, PanOptions pan, ZoomOptions zoom, bool animate});
}

@JS()
@anonymous
class FitBoundsOptions extends ZoomPanOptions {
  external factory FitBoundsOptions(
      {bool reset,
      PanOptions pan,
      ZoomOptions zoom,
      bool animate,
      Point paddingTopLeft,
      Point paddingBottomRight,
      Point padding,
      num maxZoom});
}

class PanOptions {
  external factory PanOptions({bool animate, num duration, num easeLinearity, bool noMoveStart});
}
