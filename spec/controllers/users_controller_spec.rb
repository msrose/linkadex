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

  describe "POST #create" do
    context "with valid attributes" do
      it "adds a new user to the database" do
        expect { post :create, :user => FactoryGirl.attributes_for(:user) }.to change(User, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not add a user to the database" do
        expect { post :create, :user => FactoryGirl.attributes_for(:user, :name => "  ") }.not_to change(User, :count)
      end
    end
  end
end
