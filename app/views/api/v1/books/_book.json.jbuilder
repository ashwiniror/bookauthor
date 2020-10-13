json.extract! book, :id, :book_title, :created_at, :updated_at
json.url book_url(book, format: :json)
