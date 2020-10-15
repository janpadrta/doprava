require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      load_type: "Load Type",
      load_description: "Load Description",
      load_capacity: "9.99",
      load_volume: "9.99",
      origin_id: 2,
      destination_id: 3,
      distance: "9.99",
      fix_price: false,
      price_per_km: "9.99",
      price: "9.99",
      customer: nil,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Load Type/)
    expect(rendered).to match(/Load Description/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
