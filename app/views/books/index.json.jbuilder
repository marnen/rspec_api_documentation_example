json.array!(@books) do |book|
  json.extract! book, :id, :author_first_name, :author_last_name, :title
  json.url book_url(book, format: :json)
end
