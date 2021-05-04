require 'rails_helper'

RSpec.describe 'Site Navigation' do
  describe 'As a Visitor' do
    describe 'I see a nav bar where I can link to' do
      it 'the welcome page' do
        visit concerts_path

        within 'nav' do
          click_link 'Home'
        end

        expect(current_path).to eq(welcome_index_path)
      end

      it 'all photos' do
        visit welcome_index_path

        within 'nav' do
          click_link 'Photos'
        end

        expect(current_path).to eq(photos_path)
      end

      it 'all users' do
        visit users_path

        within 'nav' do
          click_link 'Users'
        end

        expect(current_path).to eq(users_path)
      end

      it 'the login page' do
        visit welcome_index_path

        within 'nav' do
          click_link 'Log In'
        end

        expect(current_path).to eq(login_path)
      end

      it 'the registraton page' do
        visit welcome_index_path

        within 'nav' do
          click_link 'Register'
        end

        expect(current_path).to eq(registration_path)
      end
    end
  end
end
