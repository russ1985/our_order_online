class Order < ActiveRecord::Base
  has_many :party_orders

  validates :token, :presence, :uniqueness

  class << self
    def create_new_with_token(user)
      order = self.new(:token => get_unique_token)
      #use when people start to sign up (Paid for)
      #user.party.orders << order
      order
    end

    private

    def get_unique_token
      token = rand(36**8).to_s(36)
      while !token_unique?(token)
        token = rand(36**8).to_s(36)
      end
      token
    end

    def token_unique?(token)
      self.where('token= ?', token).nil?
    end
  end

  def to_json_hash
    self.to_hash(
        :only => [:token, :id, :created_at],
        :additional_values => {
            :order_items => [],
            :toppings => []
        }
    )
  end

end