# README

After fork and clone you have to run `bundle install` before starting the server.

Steps to setup Devise:
Paste this in your Gimfile 

```
gem 'devise'
```
Then run
```
bundle install
```
Then run 
```
rails generate devise:install
```
Paste this configuration inside `config/environments/development.rb:`
```
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```
Then run 
```
rails generate devise User
```
Then run
```
rails db:migrate
```

[Devise.com](https://github.com/plataformatec/devise)