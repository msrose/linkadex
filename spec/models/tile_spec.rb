require 'spec_helper'

describe Tile do
  it "has a valid factory" do
    FactoryGirl.build(:tile).should be_valid
  end

  let(:tile) { FactoryGirl.create(:tile) }

  subject { tile }

  it { should respond_to(:group) }
  it { should respond_to(:link) }
  it { should respond_to(:border_color) }
  it { should respond_to(:background_color) }

  describe "without a group" do
    before { tile.group = nil }
    it { should_not be_valid }
  end

  describe "without a border color" do
    before { tile.border_color = nil }
    it { should_not be_valid }
  end

  describe "without a background color" do
    before { tile.background_color = nil }
    it { should_not be_valid }
  end
end
