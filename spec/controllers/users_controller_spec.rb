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

      it "redirects to the sign in page" do
        post :create, :user => FactoryGirl.attributes_for(:user)
        response.should redirect_to signin_url
      end
    end

    context "with invalid attributes" do
      it "does not add a user to the database" do
        expect { post :create, :user => FactoryGirl.attributes_for(:user, :name => "  ") }.not_to change(User, :count)
      end
    end
  end

  describe "GET #verify" do
    context "with a valid token" do
      before do
        @user = FactoryGirl.create(:user)
        get :verify, :token => @user.verification_token
      end

      it "identifies the correct user" do
        assigns(:user).should == @user
      end

      it "verifies the user" do
        @user.reload
        @user.should be_verified
      end

      it "renders the verification template" do
        response.should render_template :verify
      end
    end

    context "with an invalid token" do
      before { get :verify, :token => "blah" }

      it "redirects to the sign in page" do
        response.should redirect_to signin_url
      end
    end
  end

  describe "GET #show" do
    before do
      @user = FactoryGirl.create(:user)
      get :show, :id => @user.id
    end

    it "renders the show template" do
      response.should render_template :show
    end

    it "finds the correct user" do
      assigns(:user).should == @user
    end

    it "populates a list of public groups" do
      group = FactoryGirl.create(:group, :private => false, :user_id => @user.id)
      assigns(:groups).should include(group)
    end

    it "does not include private groups" do
      group = FactoryGirl.create(:group, :private => true, :user_id => @user.id)
      assigns(:groups).should_not include(group)
    end
  end
end
