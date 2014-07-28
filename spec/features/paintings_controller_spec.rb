require 'rails_helper'

RSpec.describe PaintingsController, :type => :feature do
  before :each do
    @user = FactoryGirl.create(:user)
    @gallery = FactoryGirl.create(:gallery, user_id: @user.id)
    @painting = FactoryGirl.create(:painting, gallery_id: @gallery.id)
    @user.confirm!
    signin(@user.email, @user.password)
  end

  context "create painting for a user" do
    it "should create painting for logged in user" do
      painting = FactoryGirl.build(:painting)
      visit new_painting_path(gallery_id: @gallery.id)
      print page.html
      fill_in("painting_name", with: "foo")
      attach_file "painting_image", "spec/support/fake_image.jpg"
      click_button "Add Painting"
      expect(page).to have_content 'Your new painting is uploaded!'
    end
  end

  context "destroy a painting" do
    it "should destroy the painting" do
      #visit painting_path, 
      
    end
  end
end
