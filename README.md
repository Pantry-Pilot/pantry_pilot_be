# Pantry Pilot Documentation

## Contributors
- Jorja Fleming [GitHub](https://github.com/JorjaF)
- Antoine Aube [GitHub](https://github.com/Antoine-Aube)
- Lane Bretschneider [GitHub](https://github.com/lanebret85)
- Will Chen [GitHub](https://github.com/williamfchen)


## About this Project
Pantry Pilot is an application that allows users to search for and save meal recipes based on simple ingredients found in their pantries.

Find our website here: https://pantrypilot-bb63e22bf516.herokuapp.com/

## Purpose of pantry_pilot_be
This Ruby backend application is designed to interact with the Spoonacular API and our front end app - pantry_pilot_fe. It serializes the JSON responses for our frontend client, manages user and recipe data, and handles image storage on AWS S3. Furthermore, it processes background jobs and utilizes Action Mailer for email sharing functionalities.

## Features
- **Spoonacular API Integration**: Communicates with the Spoonacular API, fetching and serializing data.
- **User and Recipe Management**: Provides endpoints for user and recipe CRUD operations.
- **AWS S3 Integration**: Manages image uploads and storage.
- **Background Workers**: Leverages background processing for non-blocking tasks.
- **Action Mailer**: Facilitates sharing recipes through email.

### Technology
- Ruby v7.0
- Bundler
- PostgreSQL
- Redis
- AWS S3
- Spoonacular API Key
- JSONAPI Serializer
- CircleCI
- Faraday
- bcyrpt
- sidekiq
- ActionMailer
- ActionStorage

## Testing
- VCR
- WebMock
- SimpleCov
- RSpec
- Capybara
- Launchy
- Orderly
- ShouldaMatchers

## Getting Started
To set up this backend application locally, you will need to run both the backend and the frontend applications. Run `rails s` to start the server.  The front end uses https://localhost:3000 to access this server on https://localhost:5000. 


