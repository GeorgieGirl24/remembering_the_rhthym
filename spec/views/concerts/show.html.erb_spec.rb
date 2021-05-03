require 'rails_helper'

RSpec.describe "concerts/show", type: :view do
  before(:each) do
    @concert = assign(:concert, Concert.create!(
      band_name: "Band Name",
      venue: "Venue"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Band Name/)
    expect(rendered).to match(/Venue/)
  end
end
