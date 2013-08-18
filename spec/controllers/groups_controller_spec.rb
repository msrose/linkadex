require 'spec_helper'

describe GroupsController do
  before { override_authorization }

  let(:group) { FactoryGirl.create(:group, :user_id => @current_user.id) }

  it "triggers edit mode" do
    controller.should be_edit_mode
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      response.should render_template :index
    end

    it "populates an array of all the groups" do
      group
      get :index
      assigns(:groups).should include(group)
    end

    it "orders the groups by order rank" do
      group1 = FactoryGirl.create(:group, :order_rank => 1254, :user_id => @current_user.id)
      group2 = FactoryGirl.create(:group, :order_rank => 1, :user_id => @current_user.id)
      get :index
      assigns(:groups).should include(group1)
      assigns(:groups).should include(group2)
      assigns(:groups).index(group1).should > assigns(:groups).index(group2)
    end

    it "sets the title of the page" do
      get :index
      assigns(:title).should == 'Groups - Linkadex'
    end
  end

  describe "GET #new" do
    before { xhr :get, :new }

    it "returns a success" do
      response.status.should == 200
    end

    it "assigns a new group to @group" do
      assigns(:group).should be_present
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "adds a group to the database" do
        expect { xhr :post, :create, :group => FactoryGirl.attributes_for(:group) }.to change(Group, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not add a group to the database" do
        expect { xhr :post, :create, :group => FactoryGirl.attributes_for(:group, :title => nil) }.not_to change(Group, :count)
      end
    end
  end

  describe "GET #edit" do
    before do
      group
      xhr :get, :edit, :id => group.id
    end

    it "has a success response" do
      response.status.should == 200
    end

    it "finds the correct group" do
      assigns(:group).should == group
    end
  end

  describe "PUT #update" do
    before do
      group
      @new_attrs = FactoryGirl.attributes_for(:group)
    end

    context "with valid attributes" do
      it "updates the group" do
        xhr :put, :update, :id => group.id, :group => @new_attrs
        group.reload
        group.title.should == @new_attrs[:title]
      end
    end

    context "with invalid attributes" do
      it "does not update the group" do
        old_title = group.title
        @new_attrs[:title] = nil
        xhr :put, :update, :id => group.id, :group => @new_attrs
        group.reload
        group.title.should == old_title
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the group" do
      group
      expect { xhr :delete, :destroy, :id => group.id }.to change(Group, :count).by(-1)
    end
  end
end
