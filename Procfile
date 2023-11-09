web: bundle exec puma -C config/puma.rb
welcomeemailworker: bundle exec sidekiq -c 2
recipesenderworker: bundle exec sidekiq -c 2 -q recipe_sender
