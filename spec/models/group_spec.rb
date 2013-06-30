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

  describe "color" do
    context "with a valid color" do
      valid_colors = ["#fff", "#abcdef", "#777", "#193599"]
      valid_colors.each do |color|
        before { group.color = color }
        it { should be_valid }
      end
    end

    context "not provided" do
      before { group.color = " " }
      it { should_not be_valid }
    end

    context "with an invalid color format" do
      invalid_colors = ["llama", "#ab123z", "#~%333d", "#39923"]
      invalid_colors.each do |color|
        before { group.color = color }
        it { should_not be_valid }
      end
    end
  end
end
