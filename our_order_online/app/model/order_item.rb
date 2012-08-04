class OrderItem < ActiveRecord::Base
  belongs_to :party_order
  has_many   :toppings
end