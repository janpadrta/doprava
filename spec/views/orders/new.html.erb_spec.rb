require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      load_type: "MyString",
      load_description: "MyString",
      load_capacity: "9.99",
      load_volume: "9.99",
      origin_id: 1,
      destination_id: 1,
      distance: "9.99",
      fix_price: false,
      price_per_km: "9.99",
      price: "9.99",
      customer: nil,
      user: nil
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[load_type]"

      assert_select "input[name=?]", "order[load_description]"

      assert_select "input[name=?]", "order[load_capacity]"

      assert_select "input[name=?]", "order[load_volume]"

      assert_select "input[name=?]", "order[origin_id]"

      assert_select "input[name=?]", "order[destination_id]"

      assert_select "input[name=?]", "order[distance]"

      assert_select "input[name=?]", "order[fix_price]"

      assert_select "input[name=?]", "order[price_per_km]"

      assert_select "input[name=?]", "order[price]"

      assert_select "input[name=?]", "order[customer_id]"

      assert_select "input[name=?]", "order[user_id]"
    end
  end
end
