# Intermap

Intermap is a multi-tenanted front end for Intercom. It allows you to clone a
website, which is hosted on a subdomain that you set, and install any
intercom app on it simply by inputting the app_id.

### Getting Started
To run Intermap locally, simply clone the repo and run bundle plus the migrations.

```
cd intermap
bundle install
rails db:migrate
```

Next, spin up a rails server with:
```
rails s
```

You'll likely want to test this using lvh.me instead of localhost. Since each
instance of Intermap is hosted on a subdomain, you'll run into odd behavior
when attempting to access those subdomains on localhost.

As an example, if you have an Intermap site called `coolsite`, on production
that would look like `coolsite.intermap.io`. When testing locally, you'll want
to access it through:

```
coolsite.lvh.me:3000
```
