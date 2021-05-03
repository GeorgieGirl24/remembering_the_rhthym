require 'rails_helper'

RSpec.describe "concerts/edit", type: :view do
  before(:each) do
    @concert = assign(:concert, Concert.create!(
      band_name: "MyString",
      venue: "MyString"
    ))
  end

  it "renders the edit concert form" do
    render

    assert_select "form[action=?][method=?]", concert_path(@concert), "post" do

      assert_select "input[name=?]", "concert[band_name]"

      assert_select "input[name=?]", "concert[venue]"
    end
  end
end
