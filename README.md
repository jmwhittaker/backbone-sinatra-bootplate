# Backbone Sinatra Bootplate
Firstly this is a work in progress, so hold on tight!

This is a boilerplate application for web development using all of your favorite open source components.

Use this as a starting point for getting a server up and running with backbone and templating.

### Components
---

* Sinatra
* Backbone.js
* Twitter Bootstrap
* Hogan.js templating
* CoffeeScript
* SASS & Compass

### Getting started
---

I recommend that you use RVM to create a new Ruby virtual machine and gemset first.

    $ bundle install
    $ bundle exec shotgun

You should all be up and running now. That was easy.

Navigate in your browser to <http://localhost:9393>

making any changes to `app.rb` will auto load thanks to shotgun.

### Making changes
---

This is a starting point for your app. You will of course want to make changes.

So the main Backbone application is located in `app`. Main CoffeeScript file is the `js/app/app.coffee`.

Any changes to this file will be compiled automatically when you refresh the browser.

#### Making stylesheet changes

Write your CSS using SASS and Compass inside `app/css/app.scss`. You can include files as you would normally in SASS like:

    @import '_formstyles.scss';

### Todo list
---

* Add unit tests
* other stuff….

### Contribution
---

Firstly i'm not a Ruby expert so i'm sure there are better ways to do what I have done here.