require 'rails_helper'

RSpec.describe "invoices/new", type: :view do
  before(:each) do
    assign(:invoice, Invoice.new(
      reference_number: "MyText",
      order: nil,
      payment_type: "MyText",
      tax_base: "9.99",
      vat: "9.99",
      to_be_paid: "9.99",
      user: nil
    ))
  end

  it "renders new invoice form" do
    render

    assert_select "form[action=?][method=?]", invoices_path, "post" do

      assert_select "textarea[name=?]", "invoice[reference_number]"

      assert_select "input[name=?]", "invoice[order_id]"

      assert_select "textarea[name=?]", "invoice[payment_type]"

      assert_select "input[name=?]", "invoice[tax_base]"

      assert_select "input[name=?]", "invoice[vat]"

      assert_select "input[name=?]", "invoice[to_be_paid]"

      assert_select "input[name=?]", "invoice[user_id]"
    end
  end
end
