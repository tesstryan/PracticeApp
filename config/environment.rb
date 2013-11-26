# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
PracticeApp::Application.initialize!

credentials = YAML.load_file(Rails.root.join('config', 'email.yml'))

ActionMailer::Base.smtp_settings = {
  user_name: credentials["email"],
  password: credentials["password"],
  address: 'smtp.gmail.com',
  port: 587,
  authentication: 'plain',
  enable_starttls_auto: true
   }
