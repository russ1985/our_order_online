class PartyOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :party
  has_many   :order_items
end