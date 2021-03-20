require 'rails_helper'

RSpec.describe "cars/edit", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      name: "MyString",
      spz: "MyString",
      active: false
    ))
  end

  it "renders the edit car form" do
    render

    assert_select "form[action=?][method=?]", car_path(@car), "post" do

      assert_select "input[name=?]", "car[name]"

      assert_select "input[name=?]", "car[spz]"

      assert_select "input[name=?]", "car[active]"
    end
  end
end
