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

    it "redirects to the home page if the user is signed in" do
      override_authorization
      get :new
      response.should redirect_to user_path(@current_user)
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
      get :show, :username => @user.username
    end

    it "renders the show template" do
      response.should render_template :show
    end

    it "renders the template with a dotted username" do
      @user.update_attribute(:username, "michael.rose")
      @user.reload
      get :show, :username => @user.username
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

  describe "GET #index" do
    it "renders the index template" do
      get :index
      response.should render_template :index
    end

    it "populates an array of users" do
      user = FactoryGirl.create(:user)
      get :index
      assigns(:users).should include(user)
    end
  end

  describe "GET #edit" do
    before do
      @user = FactoryGirl.create(:user)
      @user.verify!
    end

    context "without a signed in user" do
      it "redirects to the user show page" do
        get :edit, :username => @user.username
        response.should redirect_to user_path(@user)
      end
    end

    context "as the current user" do
      before { controller.send(:sign_in, @user) }

      it "doesn't let the user edit other users" do
        user2 = FactoryGirl.create(:user)
        get :edit, :username => user2.username
        response.should redirect_to user_path(user2)
      end

      it "renders the edit template" do
        get :edit, :username => @user.username
        response.should render_template :edit
      end

      it "finds the correct user" do
        get :edit, :username => @user.username
        assigns(:user).should == @user
      end
    end
  end

  describe "PUT #update" do
    context "as an invalid user" do
      before { @user = FactoryGirl.create(:user) }

      it "redirects to the user show page" do
        put :update, :username => @user.username
        response.should redirect_to user_path(@user)
      end
    end

    context "as the current user" do
      context "with valid attributes" do
        before { override_authorization }

        context "with the same email" do
          before do
            put :update, :username => @current_user.username, :user => FactoryGirl.attributes_for(:user, :email => @current_user.email)
            @current_user.reload
          end

          specify "the user should still be verified" do
            @current_user.should be_verified
          end

          it "redirects to the users public profile" do
            response.should redirect_to user_path(@current_user)
          end
        end

        context "with a different email" do
          before do
            put :update, :username => @current_user.username, :user => FactoryGirl.attributes_for(:user)
            @current_user.reload
          end

          specify "the user should not be verified" do
            @current_user.should_not be_verified
          end

          it "redirect to the sign in path" do
            response.should redirect_to signin_path
          end
        end

        context "without a password" do
          before do
            put :update, :username => @current_user.username, :user => FactoryGirl.attributes_for(:user, :name => "Michael", :email => @current_user.email, :password => nil, :password_confirmation => nil)
            @current_user.reload
          end

          it "updates the user" do
            @current_user.name.should == "Michael"
          end
        end
      end

      context "with invalid attributes" do
        before { override_authorization }

        it "does not change the user" do
          old_name = @current_user.name
          put :update, :username => @current_user.username, :user => FactoryGirl.attributes_for(:user, :name => " ")
          @current_user.reload
          @current_user.name.should == old_name
        end
      end
    end
  end

  describe "GET #forgotten" do
    context "with no signed in user" do
      before { get :forgotten }

      it "renders the forgotten page" do
        response.should render_template :forgotten
      end
    end

    context "with a signed in user" do
      before do
        override_authorization
        get :forgotten
      end

      it "redirects to the user page" do
        response.should redirect_to user_path(@current_user)
      end
    end
  end

  describe "PUT #reset" do
    context "with a signed in user" do
      before do
        override_authorization
        put :reset, :user => { :email => @current_user.email }
      end

      it "redirects to the user page" do
        response.should redirect_to user_path(@current_user)
      end
    end

    context "with a correct email" do
      before do
        @user = FactoryGirl.create(:user)
        @old_digest = @user.password_digest
        put :reset, :user => { :email => @user.email }
      end

      it "redirects to the sign in page" do
        response.should redirect_to signin_path
      end

      it "changes the password digest" do
        @old_digest.should_not == @user.password_digest
      end
    end

    context "with an invalid email" do
      before { put :reset, :user => { :email => 'never_seen@before.com' } }

      it "renders the forgotten template" do
        response.should render_template :forgotten
      end
    end
  end

  describe "DELETE #destroy" do
    before { override_authorization }

    context "as the current user" do
      it "deletes the user's account" do
        expect { delete :destroy, :username => @current_user.username }.to change(User, :count).by(-1)
      end

      it "redirects to the sign in path" do
        delete :destroy, :username => @current_user.username
        response.should redirect_to signin_path
      end
    end
  end
end
