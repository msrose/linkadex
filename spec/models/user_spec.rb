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
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:verification_token) }
  it { should respond_to(:username) }

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

  describe "with a duplicate email" do
    before { @duplicate_user = FactoryGirl.build(:user, :email => user.email) }
    specify { @duplicate_user.should_not be_valid }
  end

  describe "with a duplicate email with different case" do
    before { @duplicate_user = FactoryGirl.build(:user, :email => user.email.upcase) }
    specify { @duplicate_user.should_not be_valid }
  end

  describe "without a password digest" do
    before { user.password_digest = "" }
    it { should_not be_valid }
  end

  it "downcases the email before saving" do
    user.update_attribute(:email, "USER@EXAMPLE.COM")
    user.email.should == "user@example.com"
  end

  describe "with a password that is too short" do
    before do
      user.password = "hi"
      user.password_confirmation = "hi"
    end
    it { should_not be_valid }
  end

  describe "with mismatching password confirmation" do
    before do
      user.password = "lemon"
      user.password_confirmation = "curry"
    end
    it { should_not be_valid }
  end

  describe "with an invalid username" do
    ["msrose%", "ldskg_dg$", "", "michael.rose", "michael_rose", "michael-rose"].each do |username|
      before { user.username = username }
      it { should_not be_valid }
    end
  end

  describe "with a valid username" do
    ["msrose", "hellokitty235", "blahhumbug12345", "31535alkfj"].each do |username|
      before { user.username = username }
      it { should be_valid }
    end
  end

  describe "with a capitalized username" do
    before { user.username = "MICHAEL" }

    it "downcases the username" do
      user.save
      user.username.should == "michael"
    end
  end

  describe "with a duplicate username" do
    before { @duplicate_user = FactoryGirl.build(:user, :username => user.username) }
    specify { @duplicate_user.should_not be_valid }
    before { @duplicate_user = FactoryGirl.build(:user, :username => user.username.upcase) }
    specify { @duplicate_user.should_not be_valid }
  end
end
