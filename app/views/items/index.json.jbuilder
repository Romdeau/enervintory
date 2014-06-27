json.array!(@items) do |item|
  json.extract! item, :id, :serial, :name, :manufacturer, :ubt_serial, :description, :user_id
  json.url item_url(item, format: :json)
end
