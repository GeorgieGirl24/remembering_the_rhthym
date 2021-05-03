require 'rails_helper'

RSpec.describe "concerts/new", type: :view do
  before(:each) do
    assign(:concert, Concert.new(
      band_name: "MyString",
      venue: "MyString"
    ))
  end

  it "renders new concert form" do
    render

    assert_select "form[action=?][method=?]", concerts_path, "post" do

      assert_select "input[name=?]", "concert[band_name]"

      assert_select "input[name=?]", "concert[venue]"
    end
  end
end
