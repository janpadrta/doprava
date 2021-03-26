require 'rails_helper'

RSpec.describe "stops/index", type: :view do
  before(:each) do
    assign(:stops, [
      Stop.create!(
        type: "Type",
        label: "Label",
        street: "Street",
        number: "Number",
        zip_code: "Zip Code",
        city: "City",
        country: "Country",
        way_back: false
      ),
      Stop.create!(
        type: "Type",
        label: "Label",
        street: "Street",
        number: "Number",
        zip_code: "Zip Code",
        city: "City",
        country: "Country",
        way_back: false
      )
    ])
  end

  it "renders a list of stops" do
    render
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: "Label".to_s, count: 2
    assert_select "tr>td", text: "Street".to_s, count: 2
    assert_select "tr>td", text: "Number".to_s, count: 2
    assert_select "tr>td", text: "Zip Code".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "Country".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
