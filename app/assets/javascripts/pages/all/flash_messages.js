$(window).on('route:load', function () {
  $('.message .close').click(function() {
    $(this).closest('.message').fadeOut();
  });
});
