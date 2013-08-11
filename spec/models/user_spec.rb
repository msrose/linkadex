require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.build(:user).should be_valid
  end

  let(:user) { FactoryGirl.create(:user) }

  subject { user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:groups) }
  it { should respond_to(:links) }
  it { should respond_to(:colors) }

  describe "without a name" do
    before { user.name = "" }
    it { should_not be_valid }
  end

  describe "without an email" do
    before { user.email = "" }
    it { should_not be_valid }
  end

  describe "with an invalid email format" do
    before { user.email = "squirrel@hey" }
    it { should_not be_valid }
  end

  describe "with an valid email format" do
    before { user.email = "squirrel@example.com" }
    it { should be_valid }
  end

  describe "without a password digest" do
    before { user.password_digest = "" }
    it { should_not be_valid }
  end

  describe "with mismatching password confirmation" do
    before do
      user.password = "lemon"
      user.password_confirmation = "curry"
    end
    it { should_not be_valid }
  end
end
