
var SigninPage= React.createClass({
	render: function() {
		return (
			<section className="page" ref="register">
				<div>
					<h1>Register</h1>
					<form ref="register-form">
						<input type="text" placeholder="username" ref="register-username"/>
						<input type="password" placeholder="password" ref="register-password"/>
						<div className="error" ref="register-error"></div>
						<button type="submit">Register</button>
					</form>
				</div>
				<div className="page" ref="login">
					<h1>Login</h1>
					<form ref="login-form">
						<input type="text" placeholder="username" ref="login-username"/>
						<input type="password" placeholder="password" ref="login-password"/>
						<div className="error" ref="login-error"></div>
						<button type="submit">Login</button>
					</form>
				</div>
			</section>
		);
	}
});
