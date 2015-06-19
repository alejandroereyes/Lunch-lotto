var UserModel = require ('../models.userModel.jsx')

module.exports = Backbone.Collection.extend ({
	model : UserModel,
	url: 'https://lunch-lotto.herokuapp.com/'
});