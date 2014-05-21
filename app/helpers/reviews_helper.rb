module ReviewsHelper

  def star_rating(rating)
    full_stars = '★' * rating
    empty_stars = '☆' * (5 - rating)

    full_stars + empty_stars
  end
end
