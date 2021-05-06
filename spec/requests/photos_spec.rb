 require 'rails_helper'
RSpec.describe "/photos", type: :request do

  describe "GET /index" do
    before :each do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test', avatar: file)
      concert = Concert.create(band_name: 'Lake Street Dive', venue: 'The Gothic Theater', concert_date: '11/06/2019')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      @valid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: concert.id,
        concert_photo: file
      }

      @invalid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: ''
      }
    end

    it "renders a successful response" do
      Photo.create! @valid_attributes
      get photos_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    before :each do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test', avatar: file)
      concert = Concert.create(band_name: 'Lake Street Dive', venue: 'The Gothic Theater', concert_date: '11/06/2019')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      @valid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: concert.id,
        concert_photo: file
      }

      @invalid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: ''
      }
    end

    it "renders a successful response" do
      photo = Photo.create! @valid_attributes
      get photo_url(photo)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    before :each do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test', avatar: file)
      concert = Concert.create(band_name: 'Lake Street Dive', venue: 'The Gothic Theater', concert_date: '11/06/2019')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      @valid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: concert.id,
        concert_photo: file
      }

      @invalid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: ''
      }
    end

    it "renders a successful response" do
      get new_photo_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    before :each do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test', avatar: file)
      concert = Concert.create(band_name: 'Lake Street Dive', venue: 'The Gothic Theater', concert_date: '11/06/2019')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      @valid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: concert.id,
        concert_photo: file
      }

      @invalid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: ''
      }
    end

    it "render a successful response" do
      photo = Photo.create! @valid_attributes
      get edit_photo_url(photo)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    before :each do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test', avatar: file)
      concert = Concert.create(band_name: 'Lake Street Dive', venue: 'The Gothic Theater', concert_date: '11/06/2019')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      @valid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: concert.id,
        concert_photo: file
      }

      @invalid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: ''
      }
    end

    context "with valid parameters" do
      it "creates a new Photo" do
        visit profile_path
        click_button 'Add Photos'
        fill_in 'Name', with: @valid_attributes[:name]
        # select @valid_attributes[:concert_date], from: 'Concert date'
        # fill_in 'Concert date', with: @valid_attributes[:concert_date]
        # select @valid_attributes[:concert], from: 'Concert'
        # fill_in 'Concert', with: @valid_attributes[:concert]
        # select @file, from: 'Choose file'
        click_button 'Create Photo'
        photo = Photo.create(@valid_attributes)
        expect(current_path).to eq("/photos")
      end

      it "redirects to the created photo" do

      end
    end

    context "with invalid parameters" do
      it "does not create a new Photo" do

      end

      it "renders a successful response (i.e. to display the 'new' template)" do

      end
    end
  end

  describe "PATCH /update" do
    before :each do
      @file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      @user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test', avatar: @file)
      @concert = Concert.create(band_name: 'Lake Street Dive', venue: 'The Gothic Theater', concert_date: '11/06/2019')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      @valid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: @user.id,
        concert_id: @concert.id,
        concert_photo: @file
      }

      @invalid_attributes = {
        name: '',
        concert_date: '11/06/2019',
        user_id: @user.id,
        concert_id: ''
      }

      @new_attributes = {
        name: 'Best Day Ever',
        concert_date: '11/06/2019',
        user_id: @user.id,
        concert_id: @concert.id,
        concert_photo: @file
      }

    end

    context "with valid parameters" do
      it "updates the requested photo" do
        photo = @user.photos.create! @valid_attributes
        visit "/photos/#{photo.id}/edit"

        fill_in 'Name', with: @new_attributes[:name]
        click_button 'Update Photo'
        expect(page).to have_content('Photo was successfully updated.')
        expect(current_path).to eq("/photos/#{photo.id}")
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        photo = Photo.create! @valid_attributes
        visit "/photos/#{photo.id}/edit"

        fill_in 'Name', with: @invalid_attributes[:name]
        click_button 'Update Photo'
        expect(page).to have_content('Photo was successfully updated.')
        expect(current_path).to eq("/photos/#{photo.id}")
      end
    end
  end

  describe "DELETE /destroy" do
    before :each do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test', avatar: file)
      concert = Concert.create(band_name: 'Lake Street Dive', venue: 'The Gothic Theater', concert_date: '11/06/2019')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      @valid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: concert.id,
        concert_photo: file
      }

      @invalid_attributes = {
        name: 'Jon & Roy',
        concert_date: '11/06/2019',
        user_id: user.id,
        concert_id: ''
      }
    end

    it "destroys the requested photo" do
      photo = Photo.create! @valid_attributes
      expect {
        delete photo_url(photo)
      }.to change(Photo, :count).by(-1)
    end

    it "redirects to the photos list" do
      photo = Photo.create! @valid_attributes
      delete photo_url(photo)
      expect(response).to redirect_to(photos_url)
    end
  end
end
