$(document).ready(function() {
  submit_review();


});

function submit_review(){

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

function create_restaurant(){
   
};

function disableButton(className, callback) {
    $(className).on('submit', function(event){
        event.preventDefault();
        callback(this);
    })
}