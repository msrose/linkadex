require 'spec_helper'

describe Link do
  it "has a valid factory" do
    FactoryGirl.build(:link).should be_valid
  end

  let(:link) { FactoryGirl.create(:link) }

  subject { link }

  it { should respond_to(:group) }
  it { should respond_to(:href) }
  it { should respond_to(:title) }
  it { should respond_to(:color) }
  it { should respond_to(:target) }
  it { should respond_to(:border_color) }
  it { should respond_to(:background_color) }
  it { should respond_to(:order_rank) }

  describe "without an href" do
    before { link.href = nil }
    it { should_not be_valid }
  end

  describe "without a title" do
    before { link.title = nil }
    it { should_not be_valid }
  end

  describe "without a color" do
    before { link.color = nil }
    it { should_not be_valid }
  end

  describe "without a target" do
    before { link.target = nil }
    it { should_not be_valid }
  end

  describe "with a duplicate href" do
    before { @duplicate_link = FactoryGirl.build(:link, :href => link.href) }
    specify { @duplicate_link.should_not be_valid }
  end

  describe "with a duplicate title" do
    before { @duplicate_link = FactoryGirl.build(:link, :title => link.title) }
    specify { @duplicate_link.should_not be_valid }
  end

  describe "without a group" do
    before { link.group = nil }
    it { should_not be_valid }
  end

  describe "without a border color" do
    before { link.border_color = nil }
    it { should_not be_valid }
  end

  describe "without a background color" do
    before { link.background_color = nil }
    it { should_not be_valid }
  end
end
