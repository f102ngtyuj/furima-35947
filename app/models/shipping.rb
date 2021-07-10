class Shipping
  include ActiveModel::Model
  attr_accessor :purchase,:post_code,:area_id,:municipality,:address,:building_name,:phone_number
end
