# README #

This README would normally document whatever steps are necessary to get your application up and running.

## What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

#### Rails ####

1. Get PostgresSQL, info can be [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-14-04)

2. Get RVM (unless you already got it), info in [here](https://rvm.io/rvm/install)

3. Install the correct Ruby version (currently 2.6.5) -> `rvm install 3.0.0`

4. Install the Bundler gem -> `gem install bundler`

5. Install the other gems -> `bundle` OR `bundle install`

6. Setup the database -> `rake db:setup`

### Run the local server ####

* Run the server -> `foreman start`, this will start your local server at `localhost:3000/`

* In a separate terminal, navigate to [shoe-store](https://github.com/mathieugagne/shoe-store) and run `websocketd --port=8080 ruby inventory.rb` to start the WS server.

### Run tests ###

1. `rake db:test:prepare`

2. `rspec`

3. Test coverage report can be found in `coverage/index.html`

### Contribution guidelines ###

* We use Rspec for writing tests, if unfamiliar with it, can find a guide [here](https://github.com/rspec/rspec-rails)

* Project uses HAML instead of the normal ERB/HTML based Rails templates, if unfamiliar with HAML you can find a guide [here](https://github.com/haml/haml)

* Before submitting pull requests for review, make sure to run `rubocop -a`, which will find code offenses, it will auto-fix some and point out the rest for you to fix. A guide of Rubocop use can be found [here](http://rubocop.readthedocs.io/en/latest/)

* To generate a visual guide of the database model run -> `erd`, a guide of the ERD gem can be found [here](https://github.com/voormedia/rails-erd)

### Who do I talk to? ###

* Repo owner or admin

* Other community or team contact
