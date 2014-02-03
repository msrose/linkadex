require 'spec_helper'

describe Clone do
  it "has a valid factory" do
    FactoryGirl.build(:clone).should be_valid
  end

  let(:clone) { FactoryGirl.create(:clone) }

  subject { clone }

  it { should respond_to(:user) }
  it { should respond_to(:group) }

  describe "a clone without a user" do
    before { clone.user = nil }
    it { should_not be_valid }
  end

  describe "a clone without a group" do
    before { clone.group = nil }
    it { should_not be_valid }
  end

  describe "a duplicate clone" do
    before { @dup = FactoryGirl.build(:clone, :user_id => clone.user_id, :group_id => clone.group_id) }
    specify { @dup.should_not be_valid }
  end
end
