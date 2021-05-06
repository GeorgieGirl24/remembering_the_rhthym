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

    it 'can upload a photo that will serve as the User avatar and shows up on navbar' do
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

  # describe "GET /edit" do
  #   it "render a successful response" do
  #     user = User.create! @valid_attributes
  #     get edit_user_url(user)
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "POST /create" do
  #   before :each do
  #     @valid_attributes = {
  #       name: "Deshawn",
  #       email: "deshawn@example.com",
  #       password: "securepassword"
  #     }
  #     @invalid_attributes = {
  #       name: "Larry",
  #       email: "larry@example.com",
  #       password: ""
  #     }
  #   end
  #
  #   context "with valid parameters" do
  #     it "register as a new user" do
  #       visit welcome_index_path
  #       click_link 'Register'
  #       fill_in 'Name', with: @valid_attributes[:name]
  #       fill_in 'Email', with: @valid_attributes[:email]
  #       fill_in 'Password', with: 'password'
  #       fill_in 'Password confirmation', with: 'password'
  #       click_button 'Register'
  #
  #       expect(current_path).to eq(profile_path)
  #       expect(page).to have_content("Welcome, #{user.name}")
  #     end
  #
  #     it "redirects to the created user" do
  #       post users_url, params: { user: @valid_attributes }
  #       expect(response).to redirect_to(user_url(User.last))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "does not create a new User" do
  #       expect {
  #         post users_url, params: { user: @invalid_attributes }
  #       }.to change(User, :count).by(0)
  #     end
  #
  #     it "renders a successful response (i.e. to display the 'new' template)" do
  #       post users_url, params: { user: @invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested user" do
  #       user = User.create! @valid_attributes
  #       patch user_url(user), params: { user: new_attributes }
  #       user.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "redirects to the user" do
  #       user = User.create! @valid_attributes
  #       patch user_url(user), params: { user: new_attributes }
  #       user.reload
  #       expect(response).to redirect_to(user_url(user))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "renders a successful response (i.e. to display the 'edit' template)" do
  #       user = User.create! @valid_attributes
  #       patch user_url(user), params: { user: @invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe "DELETE /destroy" do
  #   before :each do
  #     @valid_attributes = {
  #       name: "Deshawn",
  #       email: "deshawn@example.com",
  #       password: "securepassword"
  #     }
  #     @invalid_attributes = {
  #       name: "Larry",
  #       email: "larry@example.com",
  #       password: ""
  #     }
  #   end

    # it "destroys the requested user" do
    #   user = User.create! @valid_attributes
    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    #   visit welcome_index_path
    #
    #   click_link 'Profile'
    #   click_link
    #   expect {
    #     delete user_url(user)
    #   }.to change(User, :count).by(-1)
    # end
    #
    # it "redirects to the users list" do
    #   user = User.create! @valid_attributes
    #   delete user_url(user)
    #   expect(response).to redirect_to(users_url)
    # end
  # end
end
