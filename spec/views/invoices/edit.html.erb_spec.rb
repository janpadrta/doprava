require 'rails_helper'

RSpec.describe "invoices/edit", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      reference_number: "MyText",
      order: nil,
      payment_type: "MyText",
      tax_base: "9.99",
      vat: "9.99",
      to_be_paid: "9.99",
      user: nil
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

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
