// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
var $eventPosts = $('#events');
$(function (){
  $.ajax({
    type: 'GET',
    url: 'api/events'
    success: function(events) {
      $.each(events, function(i, item){
        $events.append('<li>name:'+event.name+', description: '+event.description+'</li>');
      });
    }

  });
});
