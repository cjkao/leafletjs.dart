
L.Icon = L.Class.extend({

	initialize: function (options) {
		L.setOptions(this, options);
	},

	// @method createIcon(oldIcon?: HTMLElement): HTMLElement
	// Called internally when the icon has to be shown, returns a `<img>` HTML element
	// styled according to the options.
	createIcon: function (oldIcon) {
		return this._createIcon('icon', oldIcon);
	},

	// @method createShadow(oldIcon?: HTMLElement): HTMLElement
	// As `createIcon`, but for the shadow beneath it.
	createShadow: function (oldIcon) {
		return this._createIcon('shadow', oldIcon);
	},

}
);


// @factory L.icon(options: Icon options)
// Creates an icon instance with the given options.
L.icon = function (options) {
	return new L.Icon(options);
};
