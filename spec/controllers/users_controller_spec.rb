require 'spec_helper'

describe UsersController do
  describe "GET #new" do
    before { get :new }

    it "renders the new template" do
      response.should render_template :new
    end

    it "provides an empty user" do
      assigns(:user).should be_present
    end

    it "provides the form button text action" do
      assigns(:action).should == 'Sign up'
    end
  end
end
