
# Survey management
An Ruby on Rails API application that allows user to manage surveys with questions and answers and report the average answers for scored questions

 * System dependencies
PostgresQL
Docker, docker-compose
* Features
CRUD apis for respondents with profile
CRUD apis for questions
*Survey:*
Create a survey with new question(prompt, type, optional) or existed questions
Answer the question for the survey through update api with list of answers
Average response by scored_question

* API document
Import ```postman_collection.json``` in project root to [Postman](https://www.postman.com/). There is examples for each API inside

 * Design process
*Models:*
Question: STI models (Base, Scored, Open_Ended)
Answer: STI models (Base, Scored, Open_Ended)
Respondent
Profile
Survey

 * Configuration
 *Test / Development in docker-compose*: Change the environment in .env folder (database file, web server file)
*Local*: Run this command below to set environment
```
export DATABASE_HOST=localhost DATABASE_PASSWORD=password DATABASE_USER=postgres DATABASE_DB=survey_development
```
 * Deployment instructions
```
    docker-compose up -d --build
    docker-compose run web rake db:create
    docker-compose run web rake db:migrate
```
    

