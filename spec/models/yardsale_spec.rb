require 'spec_helper'

describe Yardsale do

  let(:user) { FactoryGirl.create(:user) }
  before { @yardsale = user.yardsales.build(description: "Lorem ipsum") }

  subject { @yardsale }

  it { should respond_to(:title) }
  it { should respond_to(:date) }
  it { should respond_to(:begin_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:description) }
  # it { should respond_to(:address_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Yardsale.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @yardsale.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @yardsale.title = " " }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @yardsale.title = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @yardsale.description = " " }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @yardsale.description = "a" * 141 }
    it { should_not be_valid }
  end
end