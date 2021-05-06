require 'rails_helper'
RSpec.describe "/users", type: :request do

  describe "GET /index" do
    before :each do
      @valid_attributes = {
        name: "Deshawn",
        email: "deshawn@example.com",
        password: "securepassword"
      }
      @invalid_attributes = {
        name: "Larry",
        email: "larry@example.com",
        password: ""
      }
    end

    it "renders a successful response" do
      User.create! @valid_attributes
      get users_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    before :each do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      @valid_attributes = {
        name: "Deshawn",
        email: "deshawn@example.com",
        password: "securepassword",
        avatar: file
      }
      @invalid_attributes = {
        name: "Larry",
        email: "larry@example.com",
        password: ""
      }
    end

    it "can get to a User ShowPage" do
      user = User.create! @valid_attributes
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit welcome_index_path
      click_link 'Profile'

      expect(page).to have_content("Welcome, #{user.name}")
    end

    it 'can see a list of Users own concerts' do
      user = User.create! @valid_attributes
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit welcome_index_path
      click_link 'Profile'

      expect(page).to have_content('My Concerts')
      expect(page).to have_content("You don't have any concerts on file. You should add one!")
    end

    it 'can create a new Concert' do
      user = User.create! @valid_attributes
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit welcome_index_path
      click_link 'Profile'

      expect(page).to have_content('My Concerts')
      click_button 'Add Concert'
      expect(current_path).to eq(new_concert_path)
      expect(page).to have_content('Band name')
      expect(page).to have_content('Venue')
      expect(page).to have_content('Concert date')
      expect(page).to have_button('Create Concert')
    end

    it 'can see a list of Users own photos' do
      user = User.create! @valid_attributes
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit welcome_index_path
      click_link 'Profile'

      expect(page).to have_content('My Photos')
      expect(page).to have_content("You don't have any concerts on file. You should add one!")

    end

    it 'can add new photos' do
      user = User.create! @valid_attributes
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit welcome_index_path
      click_link 'Profile'

      expect(page).to have_content('My Photos')
      expect(page).to have_content("You don't have any concerts on file. You should add one!")

      click_button 'Add Photo'
      expect(current_path).to eq(new_photo_path)
      expect(page).to have_content('Name')
      expect(page).to have_content('Concert')
      expect(page).to have_content('Concert date')
      expect(page).to have_content('Concert photo')
      expect(page).to have_button('Create Photo')
    end

    it 'can upload a photo that will serve as the User avatar' do
      user = User.create! @valid_attributes
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit welcome_index_path
      click_link 'Profile'

      expect(page).to have_link 'Update Profile'
      click_link 'Update Profile'
      expect(current_path).to eq(profile_edit_path)

      expect(page).to have_content('Add avatar to your profile')
    end

    xit 'can upload a photo that will serve as the User avatar and shows up on navbar' do
      user = User.create! @valid_attributes
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit welcome_index_path
      click_link 'Profile'

      expect(page).to have_link 'Update Profile'
      click_link 'Update Profile'
      expect(current_path).to eq(profile_edit_path)

      expect(page).to have_content('Add avatar to your profile')

      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
      select file, from: 'Choose File'

      expect(page).to have_content("#{user.name} successfully updated your profile")
    end
  end
end
