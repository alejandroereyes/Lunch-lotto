
module.exports = React.createClass({
	render: function() {
		return (
	<section class="page" ref="register">
			<h1>Register</h1>
			<form ref="register-form">
				<input type="text" placeholder="username" id="register-username">
				<input type="password" placeholder="password" id="register-password">
				<div class="error" ref="register-error"></div>
				<button type="submit">Register</button>
			</form>
		</section>
		<section class="page" ref="login">
			<h1>Login</h1>
			<form ref="login-form">
				<input type="text" placeholder="username" ref="login-username">
				<input type="password" placeholder="password" ref="login-password">
				<div class="error" ref="login-error"></div>
				<button type="submit">Login</button>
			</form>