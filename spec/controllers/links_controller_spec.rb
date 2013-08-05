require 'spec_helper'

describe LinksController do
  it "triggers edit mode" do
    controller.should be_edit_mode
  end

  let(:group) { FactoryGirl.create(:group) }
  let(:group_link) { FactoryGirl.create(:link, :group_id => group.id) }

  describe "GET #index" do
    it "renders the template" do
      get :index, :group_id => group.id
      response.should render_template :index
    end

    it "assigns the correct links to @links" do
      group_link
      get :index, :group_id => group.id
      assigns(:links).should == [group_link]
    end
  end

  describe "GET #new" do
    before { xhr :get, :new, :group_id => group.id }

    it "returns a success response" do
      response.status.should == 200
    end

    it "initializes a new link in the group" do
      assigns(:link).group.should == group
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "adds a group to the database" do
        expect { xhr :post, :create, :group_id => group.id, :link => FactoryGirl.attributes_for(:link, :group_id => group.id) }.to change(Link, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not add a group to the database" do
        expect { xhr :post, :create, :group_id => group.id, :link => FactoryGirl.attributes_for(:link, :group_id => group.id, :title => nil) }.not_to change(Link, :count)
      end
    end
  end

  describe "GET #edit" do
      before { xhr :get, :edit, :group_id => group.id, :id => group_link }

    it "returns a success response" do
      response.status.should == 200
    end

    it "finds the correct link" do
      assigns(:link).should == group_link
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "updates the link" do
        new_attrs = FactoryGirl.attributes_for(:link)
        xhr :put, :update, :group_id => group.id, :id => group_link.id, :link => new_attrs
        group_link.reload
        group_link.title.should == new_attrs[:title]
      end
    end

    context "with invalid attributes" do
      it "does not update the link" do
        old_title = group_link.title
        xhr :put, :update, :group_id => group.id, :id => group_link.id, :link => FactoryGirl.attributes_for(:link, :title => nil)
        group_link.reload
        group_link.title.should == old_title
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys a link" do
      group; group_link
      expect { xhr :delete, :destroy, :group_id => group.id, :id => group_link.id }.to change(Link, :count).by(-1)
    end
  end
end
