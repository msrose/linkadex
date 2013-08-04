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
  end
end
