class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_verb, :only => [:new, :create, :edit, :update]
  helper_method :edit_mode?, :title, :current_user, :signed_in?

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

    def sign_in(user)
      token = User.new_remember_token
      cookies.permanent[:remember_token] = token
      user.update_attribute(:remember_token, User.encrypt(token))
    end

    def sign_out
      self.current_user = nil
      cookies.delete(:remember_token)
    end

    def current_user=(user)
      @current_user = user
    end

    def current_user
      remember_token = User.encrypt(cookies[:remember_token])
      @current_user ||= User.find_by_remember_token(remember_token)
    end

    def signed_in?
      current_user.present?
    end

    def require_signed_in_user
      redirect_to signup_url unless signed_in?
    end
end
