var UserModel = Backbone.Model.extend ({
	defaults: {
		user_id: null,
		name: null,
		email: null,
		password: null,
		password_confirmation: null

	},
	urlRoot: '/users',

	validate: function(attr) {

		console.log(attr);
		if (!attr.email) {
			return 'Enter a Email to Lunch!';
			console.log(attr);
		}
		// else if(!attr.email(/\S+@\S+\.\S+/)) {
		// 	return 'Return false';
		// }
		// else if( attr.indexOf(' ')!=-1 || attr.indexOf('..')!=-1){
  //       	return false;
  //   	}
  //   	else {
  //   		return true;
  //   	};
		// if(!attr.password){
		// 	return 'Please enter a password to Lunch!'; 
		// }
		
		
		
		// if(attr.password.length < 6) {
		// 	return 'Your password must be at least six characters.';
		// }
		// return false;
	}
})


