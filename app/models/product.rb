class Product < ApplicationRecord
	validates :title, :description, :image_url, presence: true
	validates :description, length: { minimum: 10 }
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true

	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
	 	message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
	}

	def self.latest
	 Product.order(:updated_at).last
	end
end
