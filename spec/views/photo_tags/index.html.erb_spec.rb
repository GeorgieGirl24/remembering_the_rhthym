require 'rails_helper'

RSpec.describe "photo_tags/index", type: :view do
  before(:each) do
    assign(:photo_tags, [
      PhotoTag.create!(
        photo: nil,
        tag: nil
      ),
      PhotoTag.create!(
        photo: nil,
        tag: nil
      )
    ])
  end

  it "renders a list of photo_tags" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
