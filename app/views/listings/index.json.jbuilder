json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :desciption, :price
  json.url listing_url(listing, format: :json)
end
