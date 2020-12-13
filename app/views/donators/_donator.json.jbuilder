json.extract! donator, :id, :name, :address, :phone, :created_at, :updated_at
json.url donator_url(donator, format: :json)
