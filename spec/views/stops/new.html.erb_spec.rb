require 'rails_helper'

RSpec.describe "stops/new", type: :view do
  before(:each) do
    assign(:stop, Stop.new(
      type: "",
      label: "MyString",
      street: "MyString",
      number: "MyString",
      zip_code: "MyString",
      city: "MyString",
      country: "MyString",
      way_back: false
    ))
  end

  it "renders new stop form" do
    render

    assert_select "form[action=?][method=?]", stops_path, "post" do

      assert_select "input[name=?]", "stop[type]"

      assert_select "input[name=?]", "stop[label]"

      assert_select "input[name=?]", "stop[street]"

      assert_select "input[name=?]", "stop[number]"

      assert_select "input[name=?]", "stop[zip_code]"

      assert_select "input[name=?]", "stop[city]"

      assert_select "input[name=?]", "stop[country]"

      assert_select "input[name=?]", "stop[way_back]"
    end
  end
end
