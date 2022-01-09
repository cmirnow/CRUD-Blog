# CRUD Blog on Rails. Geo-Targeted Banner Ads


[![CRUD Blog on Rails. Geo-Targeted Banner Ads](https://github.com/cmirnow/CRUD-Blog/blob/master/app/assets/images/management_images_active_storage.jpg)](https://masterpro.ws/create-blog-on-rails)


## Features

* Convenient site administration panel
* Ease of management
* Geo-Targeted Banner ADS
* Text editor
* Built-in visit analytics
* Categories
* Articles
* Pagination of the list of articles
* AJAX Contact Form
* AJAX Comments
* Comments Pre-Moderation by default
* Notifications of new comments by email
* Upload images to base64, to local storage, to AWS S3
* Preview an Image. Various preview options can be passed to the Active Storage variant method.
* Tags
* Meta Tags
* Open Graph Protocol and Twitter Card Meta Tags
* RSS
* User-Friendly URLs
* Sitemap
* Current Weather by IP on Google Map
* PhotoGallery
* SlideShow
* Lightbox
* JavaScript Time Greeting

[![CRUD Blog on Rails. Geo-Targeted Banner Ads](https://github.com/cmirnow/CRUD-Blog/blob/master/app/assets/images/edit_post.jpg)](https://masterpro.ws/deploy-blog-on-rails-to-heroku)

[Live Demo](https://mstp.herokuapp.com)

[Analytics Charts](https://mstp.herokuapp.com/analytics)

For Beginners: How to Start. [Deploying Rails Blog on Heroku](https://masterpro.ws/deploy-blog-on-rails-to-heroku).


[![CRUD Blog on Rails. Geo-Targeted Banner Ads](https://github.com/cmirnow/CRUD-Blog/blob/master/app/assets/images/ahoy_visits.jpg)](https://masterpro.ws/create-blog-on-rails)


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

Set your login and password to db/seeds.rb

Ready to get started?

```
$ bundle install
$ yarn install --check-files
$ rake db:migrate
$ rake db:seed
$ bundle exec figaro install
```

Edit:

```
#config/application.yml
RECAPTCHA_SITE_KEY: "*************************"
RECAPTCHA_SECRET_KEY: "**************************"
GMAIL_USER_NAME: '****@***********'
GMAIL_PASSWORD: '************'
DOMAIN_NAME: 'https://mstp.herokuapp.com' #For example
SEND_EMAIL_TO: '****@*********'
SUBJECT_EMAIL: 'Hurray! You got a new form!'
SUBJECT_COMMENT_EMAIL: 'You got a new comment!'
KEY_OPENWEATHERMAP: '*******************************'
GOOGLE_MAP_KEY: '*************************************'
AWS_ACCESS_KEY_ID: '********************'
AWS_SECRET_ACCESS_KEY: '*********************************'
REGION: "*********"
BUCKET: "*********"
```

```
# config/storage.yml
amazon:
service: S3
access_key_id: <%= ENV['AWS_ACCESS_KEY_ID'] %>
secret_access_key: <%= ENV['AWS_SECRET_ACCESS_KEY'] %>
region: <%= ENV['REGION'] %>
bucket: <%= ENV['BUCKET'] %>
```

OK, let's go:


```
$ rails s
```

Now login:

```
127.0.0.1:3000/admin
```

Сreate your first categories and articles.

Finally, create a sitemap:

```
rails sitemap:refresh
```

## Running specs

```
$ bundle exec rspec
```
