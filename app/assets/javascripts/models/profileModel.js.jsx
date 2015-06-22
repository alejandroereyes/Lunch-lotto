var ProfileModel = Backbone.Model.extend ({
	defaults: {
		user_id: null,
		name: null,
		bio: null,
		network: null,
		foodTypes: null,
		twitter: null,
		linkedIn: null
	},

	urlRoot: 'http:localhost:3000/profile',
	idAttribute: '_id'

})