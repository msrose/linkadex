# Use strong parameters in all of the models
ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)
