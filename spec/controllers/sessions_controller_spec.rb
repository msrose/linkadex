require 'spec_helper'

describe SessionsController do
  describe "GET #new" do
    context "with no user signed in" do
      it "renders the new template" do
        get :new
        response.should render_template :new
      end
    end

    context "with a user signed in" do
      before { override_authorization }

      it "redirects to the home page" do
        get :new
        response.should redirect_to root_url
      end
    end
  end

  describe "POST #create" do
    context "with valid sign in credentials" do
      before do
        @user = FactoryGirl.create(:user, :password => "michael", :password_confirmation => "michael")
        @user.verify!
        post :create, :session => { :email_or_username => @user.email, :password => "michael"  }
      end

      it "signs the user in" do
        controller.should be_signed_in
      end

      it "redirects to the root url" do
        response.should redirect_to root_url
      end

      it "sets the user as the current user" do
        controller.send(:current_user).should == @user
      end
    end

    context "when logging in with username" do
      before do
        @user = FactoryGirl.create(:user, :password => "michael", :password_confirmation => "michael")
        @user.verify!
        post :create, :session => { :email_or_username => @user.username, :password => "michael"  }
      end

      it "signs the user in" do
        controller.should be_signed_in
      end
    end

    context "with invalid sign in credentials" do
      before { post :create, :session => { :email_or_username => "adghkalkgd", :password => "aldgndg" } }

      it "renders the new template" do
        response.should render_template :new
      end

      it "provides an error message" do
        flash[:error].should be_present
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      controller.send(:sign_in, FactoryGirl.create(:user))
      delete :destroy
    end

    it "signs the user out" do
      controller.should_not be_signed_in
    end

    it "removes the current user" do
      controller.send(:current_user).should be_nil
    end

    it "redirects to the sign in path" do
      response.should redirect_to signin_path
    end
  end
end
