/*
 * L.TileLayer.Zoomify display Zoomify tiles with Leaflet
 */

L.TileLayer.Zoomify = L.TileLayer.extend({
	options: {
		continuousWorld: true,
		tolerance: 0.8
	},

	initialize: function (url, options) {
		options = L.setOptions(this, options);
		this._url = url;

    	var imageSize = L.point(options.width, options.height),
	    	tileSize = options.tileSize;
//
//  largest image size
// imageSize: image size in each layer
//   gridSize : List<tile_x_qty,tile_y_qty>
//   tileSize: given default 256 px
//
    	this._imageSize = [imageSize];
    	this._gridSize = [this._getGridSize(imageSize)];

        while (parseInt(imageSize.x) > tileSize || parseInt(imageSize.y) > tileSize) {
        	imageSize = imageSize.divideBy(2).floor();
        	this._imageSize.push(imageSize);
        	this._gridSize.push(this._getGridSize(imageSize));
        }

		this._imageSize.reverse();
		this._gridSize.reverse();

        this.options.maxZoom = this._gridSize.length - 1;
	},

	onAdd: function (map) {
		L.TileLayer.prototype.onAdd.call(this, map);

		var mapSize = map.getSize(),
			zoom = this._getBestFitZoom(mapSize),
			imageSize = this._imageSize[zoom],
			center = map.options.crs.pointToLatLng(L.point(imageSize.x / 2, imageSize.y / 2), zoom);

		map.setView(center, zoom, true);
	},

	_getGridSize: function (imageSize) {
		var tileSize = this.options.tileSize;
		return L.point(Math.ceil(imageSize.x / tileSize), Math.ceil(imageSize.y / tileSize));
	},

	_getBestFitZoom: function (mapSize) {
		var tolerance = this.options.tolerance,
			zoom = this._imageSize.length - 1,
			imageSize, zoom;

		while (zoom) {
			imageSize = this._imageSize[zoom];
			if (imageSize.x * tolerance < mapSize.x && imageSize.y * tolerance < mapSize.y) {
				return zoom;
			}
			zoom--;
		}

		return zoom;
	},

	_tileShouldBeLoaded: function (tilePoint) {
		var gridSize = this._gridSize[this._map.getZoom()];
		return (tilePoint.x >= 0 && tilePoint.x < gridSize.x && tilePoint.y >= 0 && tilePoint.y < gridSize.y);
	},

	_addTile: function (tilePoint, container) {

		var zoom = this._map.getZoom();
		var 	gridSize = this._gridSize[zoom];
		if(tilePoint.x <0 || tilePoint.y<0) return;
		if(tilePoint.x>gridSize.x-1|| tilePoint.y>gridSize.y-1) return;


		var tilePos = this._getTilePos(tilePoint);
	//	var tile = this.createTile(this._wrapCoords(tilePoint), L.bind(this._tileReady, this, tilePoint));

		var	tile = this.createTile(tilePoint,L.bind(this._tileReady, this, tilePoint));
	//	var	tile = this.createTile(tilePoint,function(){});
//		this._initTile(tile);

		var	imageSize = this._imageSize[zoom],

			tileSize = this.options.tileSize;

		if (tilePoint.x === gridSize.x - 1) {
			tile.style.width = imageSize.x - (tileSize * (gridSize.x - 1)) + 'px';
		}

		if (tilePoint.y === gridSize.y - 1) {
			tile.style.height = imageSize.y - (tileSize * (gridSize.y - 1)) + 'px';
		}
	//L.DomUtil.setPosition(tile, tilePos);
		L.DomUtil.setPosition(tile, tilePos, L.Browser.chrome || L.Browser.android23);
		// save tile in cache

		this._tiles[tilePoint.x + ':' + tilePoint.y] ={
			el: tile,
			current: true,
			coords: tilePoint
		};
		//this._loadTile(tile, tilePoint);
//container.appendChild(tile);
		if (tile.parentNode !== this._tileContainer) {
			container.appendChild(tile);
		}
//	this.fire('tileloadstart', {
//		tile: tile,
//		coords: tilePoint
//	});
	},

	getTileUrl: function (tilePoint) {
		return this._url + 'TileGroup' + this._getTileGroup(tilePoint) + '/' + this._map.getZoom() + '-' + tilePoint.x + '-' + tilePoint.y + '.jpg';
	},

	_getTileGroup: function (tilePoint) {
		var zoom = this._map.getZoom(),
			num = 0,
			gridSize;

		for (z = 0; z < zoom; z++) {
			gridSize = this._gridSize[z];
			num += gridSize.x * gridSize.y;
		}

		num += tilePoint.y * this._gridSize[zoom].x + tilePoint.x;
      	return Math.floor(num / 256);;
	},
	done: function(_,__){}


});

L.tileLayer.zoomify = function (url, options) {
	return new L.TileLayer.Zoomify(url, options);
};
