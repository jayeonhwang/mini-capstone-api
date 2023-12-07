class Product < ApplicationRecord
  def is_discounted?
   price < 10
  end
  def tax
    price * 0.009
  end
  def total
    price + tax
  end
end
