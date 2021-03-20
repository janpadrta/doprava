require 'rails_helper'

RSpec.describe "cars/new", type: :view do
  before(:each) do
    assign(:car, Car.new(
      name: "MyString",
      spz: "MyString",
      active: false
    ))
  end

  it "renders new car form" do
    render

    assert_select "form[action=?][method=?]", cars_path, "post" do

      assert_select "input[name=?]", "car[name]"

      assert_select "input[name=?]", "car[spz]"

      assert_select "input[name=?]", "car[active]"
    end
  end
end
