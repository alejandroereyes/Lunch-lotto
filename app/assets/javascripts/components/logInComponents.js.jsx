
var LogIn= React.createClass({
	render: function() {
		return (
			<div className="General-section col12">
				<div className="col4 col-on col-off">Hidden at Global</div>
				<div className="Signin col4">
				<form className="signup-form" id="login-page" onSubmit = {this.register}>
					<ul><li><img src="assets/Lunchbox-signin" alt=""></img></li></ul>
					<h3>Login</h3>
					<h4>New to Lunch Lotto? <a href="#register">Register Today!</a></h4>
					<div>
						<label>
							<span>Your Email:</span>
							<input placeholder="Enter your email address" type="email" tabindex="1" autofocus ref="loginEmail"/>
						</label>
					</div>
					<div>
						<label>
							<span>Your Password:</span>
							<input placeholder="Enter your password" type="password" tabindex="2" ref="loginPassword"/>
						</label>
					</div>
					<div className="error" ref="loginError"></div>
					<div className="submit-button">
					<button name="submit" type="submit" id="login-submit">Submit</button>
					</div>
				</form>

			</div>
		</div>
	);

},

	login: function(e){
		e.preventDefault()
		var currentUser = new UserModel({
			email: this.refs.loginEmail.getDOMNode().value,
			password: this.refs.loginPassword.getDOMNode().value,
		});
	},

});
