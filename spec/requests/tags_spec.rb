require 'rails_helper'
RSpec.describe "/tags", type: :request do
  describe "GET /index" do
    before :each do
      @valid_attributes = {
        name: "epic"
      }
      @invalid_attributes = {
        name: ""
      }
    end
    it 'can see mulitple tags' do
      tag = Tag.create! @valid_attributes
      bad = Tag.create!(name: 'This was not a good day for Sally! LOL')
      lovely = Tag.create!(name: 'Best day for a concert!!')

      tags = Tag.all
      expect(tags.count).to eq(3)
      expect(tags.count).to_not eq(4)
      expect(tags.count).to_not eq(2)
    end
  end

  describe "GET /show" do
    before :each do
      @valid_attributes = {
        name: "epic"
      }
      @invalid_attributes = {
        name: ""
      }
    end
    it "renders a successful response" do
      tag = Tag.create! @valid_attributes
      expect(tag.name).to eq('epic')
      expect(tag.name).to_not eq('')
    end
  end

  describe "GET /new" do

    it "can create a to a form to make a new tag" do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test')
      concert = user.concerts.create!(band_name: 'Kaleo', venue: 'Red Rocks', concert_date: '11/06/2019')
      photo = Photo.create!(name: 'Lyla and Jimmy', concert_date: '11/06/2019', user_id: user.id, concert_id: concert.id, concert_photo: file )
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


      visit "/photos/#{photo.id}"
      click_button 'Add tag'
      expect(current_path).to eq("/photos/#{photo.id}/tags/new")
      expect(page).to have_content('Add a new tag to your Photo')
    end

    it 'can redirect after creating a new Tag' do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test')
      concert = user.concerts.create!(band_name: 'Kaleo', venue: 'Red Rocks', concert_date: '11/06/2019')
      photo = Photo.create!(name: 'Lyla and Jimmy', concert_date: '11/06/2019', user_id: user.id, concert_id: concert.id, concert_photo: file )
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/photos/#{photo.id}/tags/new"
      fill_in 'Name', with: 'Kissing the night away'
      click_button 'Create Tag'

      expect(current_path).to eq("/photos/#{photo.id}")
    end

    it 'can see the new tag on the Photo Show Page' do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test')
      concert = user.concerts.create!(band_name: 'Kaleo', venue: 'Red Rocks', concert_date: '11/06/2019')
      photo = Photo.create!(name: 'Lyla and Jimmy', concert_date: '11/06/2019', user_id: user.id, concert_id: concert.id, concert_photo: file )
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/photos/#{photo.id}/tags/new"
      fill_in 'Name', with: 'Kissing the night away'
      click_button 'Create Tag'

      expect(current_path).to eq("/photos/#{photo.id}")
      expect(page).to have_content 'Kissing the night away'
    end

    it 'can see a prompt if there are no tags, to add one!' do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test')
      concert = user.concerts.create!(band_name: 'Kaleo', venue: 'Red Rocks', concert_date: '11/06/2019')
      photo = Photo.create!(name: 'Lyla and Jimmy', concert_date: '11/06/2019', user_id: user.id, concert_id: concert.id, concert_photo: file )
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/photos/#{photo.id}"
      expect(page).to have_content("#{photo.name}'s Tags")
      expect(page).to have_content('There are no tags on this photo, you should add one!')
    end

    it 'can see the new tag on the Profile/Stage Page' do
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test')
      concert = user.concerts.create!(band_name: 'Kaleo', venue: 'Red Rocks', concert_date: '11/06/2019')
      photo = Photo.create!(name: 'Lyla and Jimmy', concert_date: '11/06/2019', user_id: user.id, concert_id: concert.id, concert_photo: file )
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/photos/#{photo.id}/tags/new"
      fill_in 'Name', with: 'Kissing the night away'
      click_button 'Create Tag'

      expect(current_path).to eq("/photos/#{photo.id}")
      expect(page).to have_content 'Kissing the night away'

      click_link 'Profile'
      expect(page).to have_content 'Kissing the night away'
    end

    it 'cannot make a new tag with a missing field' do

    end
  end

  xdescribe "GET /edit" do
    it "render a successful response" do
      tag = Tag.create! valid_attributes
      get edit_tag_url(tag)
      expect(response).to be_successful
    end
  end

  xdescribe "POST /create" do
    before :each do
      @valid_attributes = {
        name: "epic"
      }
      @invalid_attributes = {
        name: ""
      }
    end

    context "with valid parameters" do
      it "creates a new Tag" do
        expect {
          post tags_url, params: { tag: valid_attributes }
        }.to change(Tag, :count).by(1)
      end

      it "can create a new Tag" do
        Tag.create! @valid_attributes
        tags = Tag.all
        expect(tags.count).to eq(1)
        expect(tags.count).to_not eq(2)
      end

      it "redirects to the created tag" do
        post tags_url, params: { tag: valid_attributes }
        expect(response).to redirect_to(tag_url(Tag.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Tag" do
        expect {
          post tags_url, params: { tag: invalid_attributes }
        }.to change(Tag, :count).by(0)
      end
      it 'cannot create a Tag with a missing name' do
        Tag.create! @invalid_attributes
        expect(page).to have_content("Name can't be blank")
        tags = Tag.all
        expect(tags.count).to eq(0)
        expect(tags.count).to_not eq(1)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post tags_url, params: { tag: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  xdescribe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested tag" do
        tag = Tag.create! valid_attributes
        patch tag_url(tag), params: { tag: new_attributes }
        tag.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the tag" do
        tag = Tag.create! valid_attributes
        patch tag_url(tag), params: { tag: new_attributes }
        tag.reload
        expect(response).to redirect_to(tag_url(tag))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        tag = Tag.create! valid_attributes
        patch tag_url(tag), params: { tag: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  xdescribe "DELETE /destroy" do
    it "destroys the requested tag" do
      tag = Tag.create! valid_attributes
      expect {
        delete tag_url(tag)
      }.to change(Tag, :count).by(-1)
    end

    it "redirects to the tags list" do
      tag = Tag.create! valid_attributes
      delete tag_url(tag)
      expect(response).to redirect_to(tags_url)
    end
  end
end
