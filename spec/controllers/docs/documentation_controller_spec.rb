require 'spec_helper'

describe Docs::DocumentationController do
  describe "GET #index" do
    before { get :index }

    it "renders the index template" do
      response.should render_template :index
    end

    it "provides the correct title" do
      assigns(:title).should == 'Documentation - Linkadex'
    end
  end

  describe "GET #features" do
    before { get :features }

    it "renders the features template" do
      response.should render_template :features
    end

    it "provides the correct title" do
      assigns(:title).should == 'Features - Linkadex'
    end
  end

  describe "GET #getting_started" do
    before { get :getting_started }

    it "renders the getting_started template" do
      response.should render_template :getting_started
    end

    it "provides the correct title" do
      assigns(:title).should == 'Getting Started - Linkadex'
    end
  end

  describe "GET #creating_link" do
    before { get :creating_links }

    it "renders the creating_links template" do
      response.should render_template :creating_links
    end

    it "provides the correct title" do
      assigns(:title).should == 'Creating Links - Linkadex'
    end
  end
end
