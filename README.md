# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
docker-compose up -d --build
docker-compose run web rake db:create
docker-compose run web rake db:migrate

export DATABASE_HOST=localhost DATABASE_PASSWORD=password DATABASE_USER=postgres DATABASE_DB=survey_development


* ...
