require 'rails_helper'

RSpec.describe "invoices/index", type: :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        reference_number: "MyText",
        order: nil,
        payment_type: "MyText",
        tax_base: "9.99",
        vat: "9.99",
        to_be_paid: "9.99",
        user: nil
      ),
      Invoice.create!(
        reference_number: "MyText",
        order: nil,
        payment_type: "MyText",
        tax_base: "9.99",
        vat: "9.99",
        to_be_paid: "9.99",
        user: nil
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
