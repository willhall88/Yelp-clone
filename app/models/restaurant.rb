class Restaurant < ActiveRecord::Base
  validates :name, :address, :cuisine,  presence: true
  validates :name, length: { minimum: 3 }
end
