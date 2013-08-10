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

    it "orders the groups by order rank" do
      group = FactoryGirl.create(:group, :order_rank => 1254)
      group2 = FactoryGirl.create(:group, :order_rank => 1)
      get :home
      assigns(:groups).should include(group)
      assigns(:groups).should include(group2)
      assigns(:groups).index(group).should > assigns(:groups).index(group2)
    end

    it "sets the title of the page" do
      get :home
      assigns(:title).should == 'Dashboard - Linkage'
    end
  end

  describe "GET #feed" do
    it "provides a JSON response" do
      get :feed, :format => "json"
      response.status.should == 200
    end

    it "gives a JSON response with callback" do
      get :feed, :format => "json", :callback => "JSON_CALLBACK"
      response.body.should include("JSON_CALLBACK")
    end
  end
end
