$(document).ready(function() {
  $('.new_review').on('submit', function(){
    event.preventDefault();
    
    var siblingList =  $(this).siblings('ul');

    $.post($(this).attr('action'), $(this).serialize(), function(response){
        var template = $('#review_template').html();
        var rendered = Mustache.render(template,response);
        siblingList.prepend(rendered);

    }, 'json' );
  });
});