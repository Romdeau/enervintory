json.array!(@softwares) do |software|
  json.extract! software, :id, :name, :serial, :notes, :item_id
  json.url software_url(software, format: :json)
end
