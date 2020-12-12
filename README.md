# CRUD Blog on Rails. Geo-Targeted Banner Ads

## Features

* Convenient site administration panel
* Ease of management
* Geo-Targeted Banner ADS
* Text editor
* Built-in visit analytics
* Articles
* AJAX Contact Form
* AJAX Comments
* Notifications of new comments by email
* Tags
* RSS
* User-Friendly URLs
* Sitemap

[Demo & Description (in Russian)](https://mstp.herokuapp.com).

# Quickly start

The application needs postgreSQL. Make sure this (for example) works:

```
$ sudo service postgresql-12 restart
Redirecting to /bin/systemctl restart postgresql-12.service
```

Next:

```
$ sudo -u postgres psql
postgres=# CREATE DATABASE analytics_app_development;
CREATE DATABASE
```

Next:

```
$ git clone https://github.com/cmirnow/CRUD-Blog.git
$ cd CRUD-Blog
```

Remove or comment out these lines. You can return them back after 'rake db:migrate':

config/initializers/ahoy.rb
```
# Deleting old entries
Ahoy::Visit.where("started_at < ?", 1.week.ago).find_in_batches do |visits|
  visit_ids = visits.map(&:id)
  Ahoy::Event.where(visit_id: visit_ids).delete_all
  Ahoy::Visit.where(id: visit_ids).delete_all
end
```

Set your login and password to db/seeds.rb

Ready to get started?

```
$ bundle install
$ yarn install --check-files
$ rake db:migrate
$ rake db:seed
$ bundle exec figaro install
```

Edit config/application.yml:

```
RECAPTCHA_SITE_KEY: "*************************"
RECAPTCHA_SECRET_KEY: "**************************"
GMAIL_USER_NAME: '****@***********'
GMAIL_PASSWORD: '************'
DOMAIN_NAME: 'https://mstp.herokuapp.com' #For example
SEND_EMAIL_TO: '****@*********'
SUBJECT_EMAIL: 'Hurray! You got a new form!'
SUBJECT_COMMENT_EMAIL: 'You got a new comment!'
```

OK, let's go:

```
$ rails s
```

Now login:

```
127.0.0.1:3000/admin
```

Сreate your first articles in the Posts tab.

Finally, create a sitemap:

```
rake sitemap:refresh
```
