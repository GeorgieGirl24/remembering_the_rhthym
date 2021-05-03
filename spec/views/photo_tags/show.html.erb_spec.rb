require 'rails_helper'

RSpec.describe "photo_tags/show", type: :view do
  before(:each) do
    @photo_tag = assign(:photo_tag, PhotoTag.create!(
      photo: nil,
      tag: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
