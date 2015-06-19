/* global Backbone React */
var App = Backbone.Router.extend({
    routes: {
        '': 'profile',
        'edit': 'edit'
    },
    profile: function() {

      React.render(<SigninPage/>, document.querySelector('#container'));
    },
    edit: function() {
      React.render(<Edit/>, document.querySelector('#container'));
    }
});

var app = new App();
Backbone.history.start();
app.navigate('edit');
