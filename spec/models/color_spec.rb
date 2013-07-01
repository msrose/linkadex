require 'spec_helper'

describe Color do
  it "has a valid factory" do
    FactoryGirl.build(:color).should be_valid
  end

  let(:color) { FactoryGirl.create(:color) }

  describe "with a valid hex value" do
    valid_hex = ["#fff", "#abcdef", "#777", "#193599"]
    valid_hex.each do |hex|
      before { color.hex_value = hex }
      it { should be_valid }
    end
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
end
