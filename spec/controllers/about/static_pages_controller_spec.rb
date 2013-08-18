require 'spec_helper'

describe About::StaticPagesController do
  it "renders the index page" do
    get :index
    response.should render_template :index
  end
end
