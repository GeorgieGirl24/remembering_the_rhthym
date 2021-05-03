require 'rails_helper'

RSpec.describe "photos/edit", type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      name: "MyString",
      loved: false,
      liked: false,
      user: nil,
      concert: nil
    ))
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input[name=?]", "photo[name]"

      assert_select "input[name=?]", "photo[loved]"

      assert_select "input[name=?]", "photo[liked]"

      assert_select "input[name=?]", "photo[user_id]"

      assert_select "input[name=?]", "photo[concert_id]"
    end
  end
end
