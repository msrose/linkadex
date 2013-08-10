require 'spec_helper'

describe DashboardController do
  describe "GET #home" do
    it "renders the home template" do
      get :home
      response.should render_template :home
    end

    it "populates an array of groups" do
      group = FactoryGirl.create(:group)
      get :home
      assigns(:groups).should == [group]
    end

    it "does not enter edit mode without the parameter" do
      get :home
      controller.should_not be_edit_mode
    end

    it "enters edit mode with the parameter" do
      get :home, :mode => "edit"
      controller.should be_edit_mode
    end
  end
end
