/* global Backbone React */
var App = Backbone.Router.extend({
    routes: {
        '': 'home',
        'home': 'home',
        'profile': 'profile',
        'register': 'register',
        'logIn':'logIn',
        'users/profile':'users/profile'

    },

    home: function() {
        React.render(<Home/>, document.querySelector('#container'));
    },
    register: function() {
        React.render(<Register/>, document.querySelector('#container'));
    },
    profile: function(){
        React.render(<Profile/>, document.querySelector('#container'));
    },
    logIn: function(){
        React.render(<LogIn/>, document.querySelector('#container'));
    }


});

var App = new App();
Backbone.history.start();
App.navigate('home')




