json.comments @review.comments
json.star_rating star_rating(@review.rating)

json.restaurant do
  json.id @restaurant.id
  json.review_count pluralize(@restaurant.reviews.count, 'review')
  json.average_rating @restaurant.average_rating
  json.average_rating_stars star_rating(@restaurant.average_rating)
end
