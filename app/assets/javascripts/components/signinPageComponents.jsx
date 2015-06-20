
var SigninPage= React.createClass({
	render: function() {
		return (
			<section className="page" ref="register">
				<div>
					<h1>Register</h1>
					<form ref="registerForm" onSubmit = {this.register}>
						<input type="text" placeholder="Email" ref="registerEmail"/>
						<input type="password" placeholder="password" ref="registerPassword"/>
						<input type="password_confirmation" placeholder="password_confirmation" ref="passwordConfirmation"/>
						<div className="error" ref="registerError"></div>

						<button type="submit">Register</button>
					</form>
				</div>
				<div className="page" ref="login">
					<h1>Login</h1>
					<form ref="loginForm" onSubmit ={this.login}>
						<input type="text" placeholder="Email" ref="loginEmail"/>
						<input type="password" placeholder="password" ref="loginPassword"/>
						<div className="error" ref="loginError"></div>
						<button type="submit">Login</button>
					</form>
				</div>
			</section>
		);
	},


	register: function(e){
		e.preventDefault()
		var newUser = new UserModel({
			email: this.refs.registerEmail.getDOMNode().value,
			password: this.refs.registerPassword.getDOMNode().value,
			password_confirmation: this.refs.passwordConfirmation.getDOMNode().value
		}	
	);

		if(!newUser.isValid()) {
				$('#registerError').html(newUser.validationError);
			}
			else {
				console.log('You should save the user');
				newUser.save();
				app.navigate('feed', {trigger: true});
			}
		

		// newUser.save()
		// console.log(newUser)
	},
	
	login: function(e){
		e.preventDefault()
		var currentUser = new UserModel({
			email: this.refs.loginEmail.getDOMNode().value,
			password: this.refs.loginPassword.getDOMNode().value,
		});

		if(!currentUser.isValid()){
			$('#login-error').html(currentUser.validationError);
		}
		else{
			loggedInUser = users.findWhere({
				email: this.refs.loginEmail.getDOMNode().value,
				password: this.refs.loginPassword.getDOMNode().value,
			});

		if(loggedInUser) {
			 	app.navigate('feed', {trigger: true});
				}
			
		else {
			$('#login-error').html('Your username / password combination is incorrect.');
		}


	};	

}

});
