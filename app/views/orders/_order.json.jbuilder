json.extract! order, :id, :datum, :load_type, :load_description, :load_capacity, :load_volume, :origin_id, :destination_id, :distance, :fix_price, :price_per_km, :price, :customer_id, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
