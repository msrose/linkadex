# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Linkadex::Application.initialize!

# Configure ActionMailer SMTP settings
mail_settings_filename = "#{Rails.root.to_s}/config/mail_settings.yml"
if File.exist?(mail_settings_filename)
  mail_settings = YAML.load(File.new(mail_settings_filename))
  ActionMailer::Base.smtp_settings = mail_settings[Rails.env] unless mail_settings[Rails.env].nil?
end
