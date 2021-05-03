 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/concerts", type: :request do
  
  # Concert. As you add validations to Concert, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Concert.create! valid_attributes
      get concerts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      concert = Concert.create! valid_attributes
      get concert_url(concert)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_concert_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      concert = Concert.create! valid_attributes
      get edit_concert_url(concert)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Concert" do
        expect {
          post concerts_url, params: { concert: valid_attributes }
        }.to change(Concert, :count).by(1)
      end

      it "redirects to the created concert" do
        post concerts_url, params: { concert: valid_attributes }
        expect(response).to redirect_to(concert_url(Concert.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Concert" do
        expect {
          post concerts_url, params: { concert: invalid_attributes }
        }.to change(Concert, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post concerts_url, params: { concert: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested concert" do
        concert = Concert.create! valid_attributes
        patch concert_url(concert), params: { concert: new_attributes }
        concert.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the concert" do
        concert = Concert.create! valid_attributes
        patch concert_url(concert), params: { concert: new_attributes }
        concert.reload
        expect(response).to redirect_to(concert_url(concert))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        concert = Concert.create! valid_attributes
        patch concert_url(concert), params: { concert: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested concert" do
      concert = Concert.create! valid_attributes
      expect {
        delete concert_url(concert)
      }.to change(Concert, :count).by(-1)
    end

    it "redirects to the concerts list" do
      concert = Concert.create! valid_attributes
      delete concert_url(concert)
      expect(response).to redirect_to(concerts_url)
    end
  end
end
