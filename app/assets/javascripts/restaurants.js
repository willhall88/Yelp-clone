$(document).ready(function() {
  $('.new_review').on('submit', function(){
    event.preventDefault();

    $.post($(this).attr('action'), $(this).serialize(), function(response){
        var template = $('#review_template').html();
        var rendered = Mustache.render(template,response);
        
        var targetId = response.restaurant.id;
        var currentRestaurant = $('.restaurant[data-id=' + targetId + ']');

        currentRestaurant.find('ul').prepend(rendered);
        
        currentRestaurant.find('h3').text(response.restaurant.review_count);
        currentRestaurant.find('h4').text('Average Rating:' + response.restaurant.average_rating_stars + response.restaurant.average_rating);
             
    }, 'json' );
  });
});