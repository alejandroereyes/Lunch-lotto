var LogoutModel = Backbone.Model.extend ({
	defaults: {
		
		name: null,
		email: null,
		password: null,
		password_confirmation: null

	},
	urlRoot: '/logout',

});