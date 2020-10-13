class Author < ApplicationRecord
	has_many :author_books
	has_many :books, through: :author_books

	def name
		"#{first_name} #{last_name}"
	end
end
