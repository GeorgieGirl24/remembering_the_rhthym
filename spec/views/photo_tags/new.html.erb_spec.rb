require 'rails_helper'

RSpec.describe "photo_tags/new", type: :view do
  before(:each) do
    assign(:photo_tag, PhotoTag.new(
      photo: nil,
      tag: nil
    ))
  end

  it "renders new photo_tag form" do
    render

    assert_select "form[action=?][method=?]", photo_tags_path, "post" do

      assert_select "input[name=?]", "photo_tag[photo_id]"

      assert_select "input[name=?]", "photo_tag[tag_id]"
    end
  end
end
