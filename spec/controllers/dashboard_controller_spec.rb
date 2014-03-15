require 'spec_helper'

describe DashboardController do
  before { override_authorization }

  describe "GET #home" do
    it "renders the home template" do
      get :home
      response.should render_template :home
    end

    it "populates an array of groups" do
      group = FactoryGirl.create(:group, :user_id => @current_user.id)
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

    it "orders the groups by order rank" do
      group = FactoryGirl.create(:group, :order_rank => 1254, :user_id => @current_user.id)
      group2 = FactoryGirl.create(:group, :order_rank => 1, :user_id => @current_user.id)
      get :home
      assigns(:groups).should include(group)
      assigns(:groups).should include(group2)
      assigns(:groups).index(group).should > assigns(:groups).index(group2)
    end

    it "sets the title of the page" do
      get :home
      assigns(:title).should == 'Dashboard - Linkadex'
    end
  end
end
