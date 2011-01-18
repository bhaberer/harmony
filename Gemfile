# include at least one source and the rails gem
source 'http://rubygems.org'
gem 'rails', '2.3.8'
#gem 'aws-s3', '0.6.2'
#gem 'paperclip', '2.3.1.1'
gem 'pg'
gem 'haml'
#gem 'rest-graph'
#gem 'patron'
#gem 'hpricot'
#gem 'money'
#gem "will_paginate", '2.3.15'


group :plugins do
  # gems that should be loaded in all environments, but depend on Rails to load
  #gem 'devise', '1.0.7', :git => 'git://github.com/bhaberer/devise.git', :branch => 'v1.0'
  gem 'devise', '1.0.8'
  gem 'hoptoad_notifier', '2.3.2'
  #gem 'google-checkout', '0.1.2', :git => 'git://github.com/bhaberer/google-checkout.git'
end

group :development do
  # bundler requires these gems in development
  gem 'mysql'
end

group :test do
  # bundler requires these gems while running tests
  gem 'rspec'
  gem 'rspec-rails'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'factory_girl', '1.3.0'
  gem 'database_cleaner', '0.5.2'
  gem 'webrat', '0.7.0'
  gem 'rcov'
end

