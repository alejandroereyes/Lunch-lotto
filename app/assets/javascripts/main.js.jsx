/* global Backbone React */
var App = Backbone.Router.extend({
    routes: {
        '': 'profile',
        'home': 'home',
        'signIn': 'signIn'
    },
    home: function() {
      React.render(<ome/>, document.querySelector('#container'));
    },
    signIn: function() {
      React.render(<SigninPage/>, document.querySelector('#container'));
    },
    profile: function(){
        React.render(<Profile/>, document.querySelector('#container'));
    }
    
});

var app = new App();
Backbone.history.start();
app.navigate('home');

 


