json.extract! customer, :id, :name, :address, :phone, :email, :ic, :dic, :created_at, :updated_at
json.url customer_url(customer, format: :json)