class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_verb, :only => [:new, :create, :edit, :update]
  helper_method :edit_mode?

  protected

    def edit_mode?
      params[:mode] == 'edit' || params[:controller] != 'dashboard'
    end

    def get_verb
      @verb = params[:action] == 'new' || params[:action] == 'create' ? 'Create' : 'Update'
    end

    def load_colors
      @colors = Color.all.collect { |color| [color.alias.blank? ? color.hex_value : color.alias, color.id, { 'data-hex' => color.hex_value }] }
      @first_color = Color.find(@colors.first[1])
    end
end
