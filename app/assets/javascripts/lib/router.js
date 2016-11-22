$(window).on('turbolinks:load', function () {
  var controller = $('body').data('controller');
  var action = $('body').data('action');
  var route = 'route:' + controller + '/' + action

  console.info('dispatch route:', route);

  $(window)
    .trigger('route:load')
    .trigger(route);
});
