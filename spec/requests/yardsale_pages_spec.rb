require 'spec_helper'

describe "Yardsale pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "yardsale creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a yardsale" do
        expect { click_button "Post" }.not_to change(Yardsale, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'yardsale_description', with: "Lorem ipsum" }
      it "should create a yardsale" do
        expect { click_button "Post" }.to change(Yardsale, :count).by(1)
      end
    end
  end
  
  describe "yardsale destruction" do
    before { FactoryGirl.create(:yardsale, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a yardsale" do
        expect { click_link "delete" }.to change(Yardsale, :count).by(-1)
      end
    end
  end
end