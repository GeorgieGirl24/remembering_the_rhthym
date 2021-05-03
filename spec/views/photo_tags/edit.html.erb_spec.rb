require 'rails_helper'

RSpec.describe "photo_tags/edit", type: :view do
  before(:each) do
    @photo_tag = assign(:photo_tag, PhotoTag.create!(
      photo: nil,
      tag: nil
    ))
  end

  it "renders the edit photo_tag form" do
    render

    assert_select "form[action=?][method=?]", photo_tag_path(@photo_tag), "post" do

      assert_select "input[name=?]", "photo_tag[photo_id]"

      assert_select "input[name=?]", "photo_tag[tag_id]"
    end
  end
end
