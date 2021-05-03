require 'rails_helper'

RSpec.describe "concerts/index", type: :view do
  before(:each) do
    assign(:concerts, [
      Concert.create!(
        band_name: "Band Name",
        venue: "Venue"
      ),
      Concert.create!(
        band_name: "Band Name",
        venue: "Venue"
      )
    ])
  end

  it "renders a list of concerts" do
    render
    assert_select "tr>td", text: "Band Name".to_s, count: 2
    assert_select "tr>td", text: "Venue".to_s, count: 2
  end
end
