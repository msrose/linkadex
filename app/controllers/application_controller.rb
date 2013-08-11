class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_verb, :only => [:new, :create, :edit, :update]
  helper_method :edit_mode?, :title

  protected

    def edit_mode?
      params[:mode] == 'edit' || params[:controller] != 'dashboard'
    end

    def get_verb
      @verb = params[:action] =~ /new|create/ ? 'Create' : 'Update'
    end

    def load_colors
      if Color.any?
        @colors = Color.all.collect { |color| [color.alias.blank? ? color.hex_value : color.alias, color.id, { 'data-hex' => color.hex_value }] }
        @first_color = Color.find(@colors.first[1])
      end
    end

    def title
      @title ||= 'Linkage'
    end
end
