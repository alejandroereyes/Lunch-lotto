/* global Backbone React */
var App = Backbone.Router.extend({
    routes: {
        '': 'home',
        'home': 'home',
        'profile': 'profile',
        'signIn': 'signIn',
        'logIn':'logIn'
    },

    home: function() {
      React.render(<Home/>, document.querySelector('#container'));
    },
    signIn: function() {
      React.render(<SigninPage/>, document.querySelector('#container'));
    },
    profile: function(){
        React.render(<Profile/>, document.querySelector('#container'));
    },
    logIn: function(){
        React.render(<logIn/>, document.querySelector('#container'));
    }

    
});

var app = new App();
Backbone.history.start();
app.navigate('home');

 


