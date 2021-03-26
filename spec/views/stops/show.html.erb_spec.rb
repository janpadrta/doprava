require 'rails_helper'

RSpec.describe "stops/show", type: :view do
  before(:each) do
    @stop = assign(:stop, Stop.create!(
      type: "Type",
      label: "Label",
      street: "Street",
      number: "Number",
      zip_code: "Zip Code",
      city: "City",
      country: "Country",
      way_back: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Label/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/false/)
  end
end
