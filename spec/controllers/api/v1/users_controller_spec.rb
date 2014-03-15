require 'spec_helper'

describe Api::V1::UsersController do

  let(:user) { FactoryGirl.create(:user) }
  let(:group) { FactoryGirl.create(:group, :user_id => user.id) }
  let(:link) { FactoryGirl.create(:link, :group_id => group.id) }

  describe "#GET groups_with_links" do
    before do
      user; group; link
    end

    it "renders correct json for the user" do
      get :groups_with_links, :username => user.username
      response.body.should include(user.name)
      response.body.should include(group.title)
      response.body.should include(link.title)
    end
  end
end
