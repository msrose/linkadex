require 'spec_helper'

describe Group do
  it "has a valid factory" do
    FactoryGirl.build(:group).should be_valid
  end

  let(:group) { FactoryGirl.create(:group) }

  subject { group }

  it { should respond_to(:links) }
  it { should respond_to(:title) }
  it { should respond_to(:color) }
  it { should respond_to(:collapsed) }
  it { should respond_to(:order_rank) }
  it { should respond_to(:user) }

  describe "without a title" do
    before { group.title = " " }
    it { should_not be_valid }
  end

  describe "without a color" do
    before { group.color = nil }
    it { should_not be_valid }
  end

  describe "with a duplicate title" do
    context "with different users" do
      before { @duplicate_group = FactoryGirl.build(:group, :title => group.title) }
      specify { @duplicate_group.should be_valid }
    end

    context "with the same user" do
      before { @duplicate_group = FactoryGirl.build(:group, :title => group.title, :user_id => group.user_id) }
      specify { @duplicate_group.should_not be_valid }
    end
  end

  describe "without a user" do
    before { group.user_id = nil }
    it
  end
end
