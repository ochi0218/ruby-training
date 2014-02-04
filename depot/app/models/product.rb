class Product < ActiveRecord::Base
    validates :title, :description, :image_url, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
    validates :title, uniqueness: true
    validates :image_url, allow_blank: true, format: { with: /^*\.(gif|jpg|png)$/i, message: 'is permit jpg or png or gif.', multiline: true }
end
