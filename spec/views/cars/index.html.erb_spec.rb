require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        name: "Name",
        spz: "Spz",
        active: false
      ),
      Car.create!(
        name: "Name",
        spz: "Spz",
        active: false
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Spz".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
