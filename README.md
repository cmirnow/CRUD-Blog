# CRUD Blog on Rails. Geo-Targeted Banner Ads


[![CRUD Blog on Rails. Geo-Targeted Banner Ads](https://github.com/cmirnow/CRUD-Blog/blob/master/public/images/management_images_active_storage.jpg)](https://masterpro.ws/create-blog-on-rails)


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
* Notifications of new comments by email
* Upload images to base64, to local storage, to AWS S3
* Tags
* Meta Tags
* RSS
* User-Friendly URLs
* Sitemap
* Current Weather by IP on Google Map
* SlideShow
* Lightbox

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
```

```
# config/storage.yml
amazon:
service: S3
access_key_id: <%= ENV['AWS_ACCESS_KEY_ID'] %>
secret_access_key: <%= ENV['AWS_SECRET_ACCESS_KEY'] %>
region: region_aws #for example: us-east-2
bucket: your_bucket_name
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
rake sitemap:refresh
```
