class Restaurant < ActiveRecord::Base
  validates :name, :address, :cuisine,  presence: true
  validates :address, length: { minimum: 3 }
  validates :name, format: { with: /\A[A-Z]/, message: 'must begin with a capital letter '}

  has_many :reviews

  def average_rating
    if reviews.any?
      reviews.average(:rating)
    else
      'N/A'
    end
  end

end
