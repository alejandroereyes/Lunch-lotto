var UserModel = Backbone.Model.extend ({
	defaults: {
		name: null,
		email: null,
		password: null,
		password_confirmation: null

	},
	urlRoot: '/users',

	validate: function(attr) {
		if (!attr.name) {
			return 'Enter a Username to Lunch!';
		}
		else if(!attr.password){
			return 'Please enter a password to Lunch!'; 

		}
		// else if(!validator.isAlphanumeric(attr.name)) {
		// 	return 'Username must only contain letters and numbers.';
		// }
		else if(attr.password.length < 6) {
			return 'Your password must be at least six characters.';
		}
		return false;
	}
});