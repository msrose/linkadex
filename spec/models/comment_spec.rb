require 'spec_helper'

describe Comment do
  it "has a valid factory" do
    FactoryGirl.build(:comment).should be_valid
  end

  let(:comment) { FactoryGirl.create(:comment) }

  it { should respond_to(:user) }
  it { should respond_to(:project) }
  it { should respond_to(:body) }

  describe "without a body" do
    before { comment.body = "" }
    it { should_not be_valid }
  end
end
