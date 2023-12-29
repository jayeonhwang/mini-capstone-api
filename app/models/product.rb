class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  
  has_many :images
  has_many :orders
  belongs_to :supplier

  def is_discounted?
   price < 10
  end
  
  def total
    price + tax
  end
  
  def tax
    price * 0.09
  end
end
