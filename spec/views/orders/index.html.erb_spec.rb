require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
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
      ),
      Order.create!(
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
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "Load Type".to_s, count: 2
    assert_select "tr>td", text: "Load Description".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
