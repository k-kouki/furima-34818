class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :text, length: {maximum: 1000}
    validates :image
    validates :price
  end

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :prefecture_id
    validates :shipping_date_id
  end
  
  validates_inclusion_of :price, in: 300..9999999, message:'Out of setting range'
  validates :price, numericality: {with: /\A[0-9]+\z/, message: 'Half-width number'}
end
