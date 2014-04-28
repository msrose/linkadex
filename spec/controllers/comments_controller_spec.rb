require 'spec_helper'

describe CommentsController do
  before { override_authorization }

  let(:group) { FactoryGirl.create(:group) }
  let(:comment) { FactoryGirl.create(:comment, :group_id => group.id) }

  describe "GET #index" do
    before { xhr :get, :index, :group_id => group.id }

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "populates a list of comments" do
      expect(assigns(:comments)).to eq(group.comments)
    end

    it "finds the correct group" do
      expect(assigns(:group)).to eq(group)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "adds a new comment to the database" do
        expect { xhr :post, :create, :group_id => group.id, :comment => FactoryGirl.attributes_for(:comment) }.to change(Comment, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not add a new comment to the database" do
        expect { xhr :post, :create, :group_id => group.id, :comment => FactoryGirl.attributes_for(:comment, :body => "") }.not_to change(Comment, :count)
      end
    end
  end

  describe "GET #edit" do
    before { xhr :get, :edit, :group_id => group.id, :id => comment.id }

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end

    it "finds the correct comment" do
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "updates the comment" do
        xhr :put, :update, :id => comment.id, :group_id => group.id, :comment => FactoryGirl.attributes_for(:comment, :body => "Michael")
        comment.reload
        expect(comment.body).to eq("Michael")
      end
    end

    context "with invalid attributes" do
      it "does not update the comment" do
        body = comment.body
        xhr :put, :update, :id => comment.id, :group_id => group.id, :comment => FactoryGirl.attributes_for(:comment, :body => "")
        comment.reload
        expect(comment.body).to eq(body)
      end
    end
  end

  describe "DELETE #destroy" do
    it "finds the correct comment" do
      xhr :delete, :destroy, :group_id => group.id, :id => comment.id
      expect(assigns(:comment)).to eq(comment)
    end

    it "destroys the comment" do
      comment
      expect { xhr :delete, :destroy, :group_id => group.id, :id => comment.id }.to change(Comment, :count).by(-1)
    end
  end
end
