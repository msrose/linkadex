require 'spec_helper'

describe Group do
  it "has a valid factory" do
    FactoryGirl.build(:group).should be_valid
  end

  let(:group) { FactoryGirl.create(:group) }

  subject { group }

  it { should respond_to(:tiles) }
  it { should respond_to(:links) }
  it { should respond_to(:title) }
  it { should respond_to(:color) }
  it { should respond_to(:collapsed) }

  describe "without a title" do
    before { group.title = " " }
    it { should_not be_valid }
  end

  describe "without a color" do
    before { group.color = nil }
    it { should_not be_valid }
  end
end
