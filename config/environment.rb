# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Linkage::Application.initialize!

# Configure ActionMailer SMTP settings
mail_settings = YAML.load(File.new("#{Rails.root.to_s}/config/mail_settings.yml"))
ActionMailer::Base.smtp_settings = mail_settings[Rails.env] unless mail_settings[Rails.env].nil?
