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
  it { should respond_to(:user) }

  describe "with a valid hex value" do
    valid_hex = ["#fff", "#abcdef", "#777", "#193599"]
    valid_hex.each do |hex|
      before { color.hex_value = hex }
      it { should be_valid }
    end
  end

  describe "with a duplicate hex value" do
    context "with a different user" do
      before { @duplicate_color = FactoryGirl.build(:color, :hex_value => color.hex_value) }
      specify { @duplicate_color.should be_valid }
    end

    context "with the same user" do
      before { @duplicate_color = FactoryGirl.build(:color, :hex_value => color.hex_value, :user_id => color.user_id) }

      specify { @duplicate_color.should_not be_valid }

      it "is case insensitive" do
        new_color = FactoryGirl.create(:color, :hex_value => '#FFFFFF')
        FactoryGirl.build(:color, :hex_value => '#ffffff', :user_id => new_color.user_id).should_not be_valid
      end
    end
  end

  describe "with a hex value not provided" do
    before { color.hex_value = " " }
    it { should_not be_valid }
  end

  describe "with a duplicate alias" do
    context "with the same user" do
      before { @duplicate_color = FactoryGirl.build(:color, :alias => color.alias, :user_id => color.user_id) }
      specify { @duplicate_color.should_not be_valid }
    end

    context "with different users" do
      before { @duplicate_color = FactoryGirl.build(:color, :alias => color.alias) }
      specify { @duplicate_color.should be_valid }
    end
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
      color.should_not be_in_use
    end
  end

  describe "without a user id" do
    before { color.user_id = nil }
    it { should_not be_valid }
  end
end
