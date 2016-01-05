/* Javascript for the official Twitter widget */

jQuery(function($) {
    !function (d, s, id) {
        var js,
        fjs = d.getElementsByTagName(s)[0],
        p = /^http:/.test(d.location) ? 'http' : 'https';
        if (!d.getElementById(id)) {
            js = d.createElement(s);
            js.id = id;
            js.src = p + "://platform.twitter.com/widgets.js";
            fjs.parentNode.insertBefore(js, fjs);
        }
    }(document, "script", "twitter-wjs");
});

jQuery(function($) {
  if ($('#add_feedback').length > 0 && document.referrer) {
    // Add url to feedback form
    $('<input type="hidden" name="page_url">').val(document.referrer).appendTo('#add_feedback');
  }
});

// Featured people
(function($) {
  var nextSlide = function nextSlide(e){
    e.preventDefault();
    var $slides = $('.js-slide');
    var $visible = $slides.filter(':visible');
    $visible.hide();
    if($visible.is(':last-child')){
      $slides.filter(':first-child').show();
    } else {
      $visible.next().show();
    }
  }

  var previousSlide = function previousSlide(e){
    e.preventDefault();
    var $slides = $('.js-slide');
    var $visible = $slides.filter(':visible');
    $visible.hide();
    if($visible.is(':first-child')){
      $slides.filter(':last-child').show();
    } else {
      $visible.prev().show();
    }
  }

  $(function(){
    $('<a href="#">')
      .addClass('feature-prev')
      .text('Previous ')
      .on('click', previousSlide)
      .appendTo('.js-feature-nav');
    $('<a href="#">')
      .addClass('feature-next')
      .text('Next')
      .on('click', nextSlide)
      .appendTo('.js-feature-nav');
  });
})(window.jQuery);
