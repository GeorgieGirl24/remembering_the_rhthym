 require 'rails_helper'

RSpec.describe "/concerts", type: :request do
  describe "GET /index" do
    before :each do
      @valid_attributes = {
        band_name: 'Jon & Roy',
        venue: 'Red Rocks Amphatheater',
        concert_date: '11/06/2019'
      }

      @invalid_attributes = {
        band_name: 'Jon & Roy',
        venue: 'Red Rocks Amphatheater',
        concert_date: ''
      }
    end

    it "renders a successful response" do
      jon_and_roy = Concert.create! @valid_attributes
      killers = Concert.create(band_name: 'The Killers', venue: 'The Ogden', concert_date: '23/09/2001')

      get concerts_url
      expect(response).to be_successful
      concerts = Concert.all
      expect(concerts.count).to eq(2)
    end
  end

  describe "GET /show" do
    before :each do
      @valid_attributes = {
        band_name: 'Jon & Roy',
        venue: 'Red Rocks Amphatheater',
        concert_date: '11/06/2019'
      }

      @invalid_attributes = {
        band_name: 'Jon & Roy',
        venue: 'Red Rocks Amphatheater',
        concert_date: ''
      }
    end
    it "can access a specific concert" do
      concert = Concert.create! @valid_attributes
      get concert_url(concert)
      expect(response).to be_successful

      expect(concert.band_name).to eq('Jon & Roy')
      expect(concert.band_name).to_not eq('The Killers')
    end
  end

  describe "Create new Concert" do
    before :each do
      @valid_attributes = {
        band_name: 'Jon & Roy',
        venue: 'Red Rocks Amphatheater',
        concert_date: '11/06/2019'
      }

      @invalid_attributes = {
        band_name: 'Jon & Roy',
        venue: 'Red Rocks Amphatheater',
        concert_date: ''
      }
    end

    it "a concert can be added to your dashboard" do
      get new_concert_url
      expect(response).to be_successful
      user = User.create(name: 'Lyla', email: 'lyla@example.com', password_digest: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit welcome_index_path
      click_link 'Profile'
      expect(page).to have_button('Add Photos')
      click_button 'Add Photos'
      expect(page).to have_button('Add Concert')
      click_button 'Add Concert'
      fill_in 'Band name', with: 'Lake Street Dive'
      fill_in 'Venue', with: 'The Gothic Theater'
      # select '11/11/2021', :from => 'Concert date'
      # select 'Concert date', with: '11/11/2011'
      click_button 'Create Concert'
      expect(current_path).to eq(new_photo_path)
    end
  end

  # describe "GET /edit" do
  #   it "render a successful response" do
  #     concert = Concert.create! @valid_attributes
  #     get edit_concert_url(concert)
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Concert" do
  #       expect {
  #         post concerts_url, params: { concert: @valid_attributes }
  #       }.to change(Concert, :count).by(1)
  #     end
  #
  #     it "redirects to the created concert" do
  #       post concerts_url, params: { concert: @valid_attributes }
  #       expect(response).to redirect_to(concert_url(Concert.last))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "does not create a new Concert" do
  #       expect {
  #         post concerts_url, params: { concert: @invalid_attributes }
  #       }.to change(Concert, :count).by(0)
  #     end
  #
  #     it "renders a successful response (i.e. to display the 'new' template)" do
  #       post concerts_url, params: { concert: @invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested concert" do
  #       concert = Concert.create! @valid_attributes
  #       patch concert_url(concert), params: { concert: new_attributes }
  #       concert.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "redirects to the concert" do
  #       concert = Concert.create! @valid_attributes
  #       patch concert_url(concert), params: { concert: new_attributes }
  #       concert.reload
  #       expect(response).to redirect_to(concert_url(concert))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "renders a successful response (i.e. to display the 'edit' template)" do
  #       concert = Concert.create! @valid_attributes
  #       patch concert_url(concert), params: { concert: @invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "DELETE /destroy" do
  #   it "destroys the requested concert" do
  #     concert = Concert.create! @valid_attributes
  #     expect {
  #       delete concert_url(concert)
  #     }.to change(Concert, :count).by(-1)
  #   end
  #
  #   it "redirects to the concerts list" do
  #     concert = Concert.create! @valid_attributes
  #     delete concert_url(concert)
  #     expect(response).to redirect_to(concerts_url)
  #   end
  # end
end
