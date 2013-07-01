class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_verb, :only => [:new, :create, :edit, :update]

  protected

    def get_verb
      @verb = params[:action] == 'new' || params[:action] == 'create' ? 'Create' : 'Update'
    end
end
