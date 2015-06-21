/* global Backbone React */
var App = Backbone.Router.extend({
    routes: {
        '': 'home',
        'home': 'home',
        'profile': 'profile',
        'register': 'register',
        'logIn':'logIn'

    },

    home: function() {
        $(".signup-form").hide(),
        $(".profile-form").hide(),
      React.render(<Home/>, document.querySelector('#container'));
    },
    register: function() {
        $("#signup-page").show(),
        $(".profile-form").hide(),
        $("#login-page").hide(),
      React.render(<register/>, document.querySelector('#container'));
    },
    profile: function(){
        $(".signup-form").hide(),
        $(".profile-form").show(),
        React.render(<Profile/>, document.querySelector('#container'));
    },
    logIn: function(){
        $("#login-page").show(),
        $(".profile-form").hide(),
        $("#signup-page").hide(),

        
        // $(".profile-form").hide(),
        React.render(<logIn/>, document.querySelector('#container'));
    }

    
});

var app = new App();
Backbone.history.start();
app.navigate('home');

 


