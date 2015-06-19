var userModel = Backbone.Model.extend ({
	defaults: {
		userId: null,
		userEmail: null,
		password: null

	},
	urlRoot: 'https://lunch-lotto.herokuapp.com/',

	validate: function(attr) {
		if (!attr.username) {
			return 'Enter a Username to Lunch!';
		}
		else if(!attr.password){
			return 'Please enter a password to Lunch!';
		}
		else if(!validator.isAlphanumeric(attr.username)) {
			return 'Username must conly contain letters and numbers.';
		}
		else if(attr.password.length < 6) {
			return 'Your password must be at least six characters.';
		}
		return false;
	}
});