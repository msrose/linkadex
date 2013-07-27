require 'spec_helper'

describe Color do
  it "has a valid factory" do
    FactoryGirl.build(:color).should be_valid
  end

  let(:color) { FactoryGirl.create(:color) }

  subject { color }

  it { should respond_to(:groups) }
  it { should respond_to(:links) }
  it { should respond_to(:alias) }

  describe "with a valid hex value" do
    valid_hex = ["#fff", "#abcdef", "#777", "#193599"]
    valid_hex.each do |hex|
      before { color.hex_value = hex }
      it { should be_valid }
    end
  end

  describe "with a duplicate hex value" do
    before { @duplicate_color = FactoryGirl.build(:color, :hex_value => color.hex_value) }
    specify { @duplicate_color.should_not be_valid }
  end

  describe "with a hex value not provided" do
    before { color.hex_value = " " }
    it { should_not be_valid }
  end

  describe "with an invalid hex format" do
    invalid_hex = ["llama", "#ab123z", "#~%333d", "#39923"]
    invalid_hex.each do |hex|
      before { color.hex_value = hex }
      it { should_not be_valid }
    end
  end

  describe "in_use method" do
    it "is in use with a group" do
      FactoryGirl.create(:group, :color_id => color.id)
      color.should be_in_use
    end

    it "is not in use without any groups or links" do
      color.groups.stub(:any?).and_return(false)
      color.links.stub(:any?).and_return(false)
      color.should_not be_in_use
    end
  end
end
