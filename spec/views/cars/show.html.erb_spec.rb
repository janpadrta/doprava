require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      name: "Name",
      spz: "Spz",
      active: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Spz/)
    expect(rendered).to match(/false/)
  end
end
