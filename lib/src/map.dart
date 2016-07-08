@JS()
library leafletjs.map;

import 'dart:html' as html;
import 'crs.dart' as crs;
import "package:js/js.dart";
import 'ilayer.dart';
import 'lat.lng.bounds.dart';
import 'lat.lng.dart';
import 'point.dart';
import 'evented.dart';
import 'bounds.dart';

@JS("L.Map")
class Map extends IEvented {
  external Map(String id, [MapOptions options]);
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

  ///
  ///Removes the given layer from the map.
  ///
  external Map removeLayer(ILayer layer);

  ///
  ///Pans the map to the closest view that would lie inside the given bounds (if it's not already), controlling the animation using the options specific, if any.
  ///
  external Map panInsideBounds(LatLngBounds bounds, [PanOptions options]);
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
  external List<ILayer> get layers;
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
  external get renderer;

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

  external factory MapOptions(
      {crs,
      LatLng center,
      num zoom,
      List<ILayer> layers,
      num minZoom,
      num maxZoom,
      LatLngBounds maxBounds,
      renderer,
      bool fadeAnimation,
      bool markerZoomAnimation,
      num transform3DLimit,
      num zoomSnap,
      num zoomDelta,
      bool trackResize});
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
