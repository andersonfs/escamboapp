web: RAILS_ENV=development rails s -b 0.0.0.0 -p 3000
mailcatcher: mailcatcher --http-ip 0.0.0.0 -f -v
sidekiq: bundle exec sidekiq -q default -q mailers