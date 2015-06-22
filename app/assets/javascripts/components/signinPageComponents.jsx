
var Register= React.createClass({
	render: function() {
		return (
			<div className="General-section col12">
				<div className="col4 col-on col-off"></div>
				<div className="Signin col4">
					<form className="signup-form" id="signup-page" onSubmit = {this.register}>
						<ul><li><img src="assets/Lunchbox-signin" alt=""> </img></li></ul>
						<h3> Register </h3>
						<h4>Already have an account? <a href="#logIn">Log in</a></h4>
						<div>
							<label>
								<span>Your Email:</span>
								<input placeholder="Enter your email address" type="text" tabIndex="1" autofocus ref="registerEmail" />
							</label>
						</div>
						<div>
							<label>
								<span>Your Password:</span>
								<input placeholder="Enter your password" type="password" tabIndex="2" required ref="registerPassword" />
							</label>
						</div>
						<div>
							<label>
								<span>Confirm Password:</span>
								<input placeholder="Confirm your password" type="password" tabIndex="3" required ref="passwordConfirmation" />
							</label>
						</div>
						<div className="error" ref="registerError"></div>
						<div className="submit-button">
							<button name="submit" type="submit" id="signup-submit">Submit</button>
						</div>
					</form>
					
				</div>
			</div>
		);
	},


	register: function(e){
		e.preventDefault()
		var newUser = new UserModel({
			email: this.refs.registerEmail.getDOMNode().value,
			password: this.refs.registerPassword.getDOMNode().value,
			password_confirmation: this.refs.passwordConfirmation.getDOMNode().value
		});

		if(!newUser.isValid()) {
			this.refs.registerError.getDOMNode().innerHTML = newUser.validationError;
		}
		else {
			newUser.save();
			app.navigate('profile', {trigger: true});
		};
	},



});
		

		// newUser.save()
		// console.log(newUser)
	
	
	

		// if(!currentUser.isValid()){
		// 	$('#login-error').html(currentUser.validationError);
		// }
		// else{
		// 	loggedInUser = user.findWhere({
		// 		email: this.refs.loginEmail.getDOMNode().value,
		// 		password: this.refs.loginPassword.getDOMNode().value,
		// 	});

		// }


	// logout: function(e){
	// 		e.preventDefault()
	// 		var currentUser = new logoutModel({
	// 		button: this.refs.logOut.getDOMNode().value,	
		
	// 	});
	// },

// });

