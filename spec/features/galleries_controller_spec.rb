require 'rails_helper'

RSpec.describe GalleriesController, :type => :feature do
  before :each do
    @user = FactoryGirl.create(:user)
    @gallery = FactoryGirl.create(:gallery, user_id: @user.id)
    @user.confirm!
    signin(@user.email, @user.password)
  end

  context "create gallery for a user" do
    it "should create gallery for logged in user" do
      gallery = FactoryGirl.build(:gallery)
      visit new_gallery_path
      fill_in("gallery_name", with: "foo")
      click_button "Create Gallery"
      expect(page).to have_content 'Your new gallery is created!'
    end
  end

  context "destroy a gallery" do
    it "should destroy the gallery" do
      #visit gallery_path, 
      
    end
  end
end
