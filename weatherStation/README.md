# The Rails App
Pay special attention to the `app` folder, `Gemfile` file, and the `config` folder.

Within `config` and the `routes.rb` file is where a client's request is redirected to whatever view is to be used.
Here, the redirection goes from no specified page (the only option) to the home view.

The `Gemfile` file needs to be changed everytime a new gem dependency is added- so the `rest-client` gem is in there.

`app` is where the heart of your front and backend will reside.
Here are your primary components of MVC (model view controller), as well as the asset pipeline (currently not used, aside from the CSS stylesheets)
and the mailers and helpers.

The `controller` folder will contain the scripts responsible for making sure the UI displays the correct things, and that users can access everything the app is designed to let them.

The `views` is where your HTML magic goes- the backbones of your UI. What your client ultimately sees is attributed to this.

Also within the `app` folder are several files that act as the _backend_- they acquire all of the data, talk to each other, act as microservices, and in the end tell the controller what data to use.
