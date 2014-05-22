$(document).ready(function() {
  submitReview();
  createRestaurant();
});

function submitReview(){

    disableButton('.new_review', function(form){
        $.post($(form).attr('action'), $(form).serialize(), function(response){
            var template = $('#review_template').html();
            var rendered = Mustache.render(template,response);
            
            var targetId = response.restaurant.id;
            var currentRestaurant = $('.restaurant[data-id=' + targetId + ']');

            currentRestaurant.find('ul').prepend(rendered);
            
            currentRestaurant.find('h3').text(response.restaurant.review_count);
            currentRestaurant.find('h4').text('Average Rating:' + response.restaurant.average_rating_stars + response.restaurant.average_rating);         
        }, 'json' );
    });   
};

function createRestaurant(){

    disableButton('.new_restaurant', function(form){
        $.post($(form).attr('action'), $(form).serialize(), function(response){
            var template = $('#ajax_restaurant').html();
            var rendered = Mustache.render(template, response);

            $('.restaurant-list').prepend(rendered);
            
        }, 'json' );

    });
};

function disableButton(className, callback) {
    $('body').on('submit', className, function(event){
        event.preventDefault();
        callback(this);
    });
};