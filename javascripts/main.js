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
  var $searchBox = $('.js-search-autocomplete-name')
  $searchBox.select2();
  $searchBox.change(function(e) {
    window.location.href = $(this).val();
  });

  if ($('#add_feedback').length > 0 && document.referrer) {
    // Add url to feedback form
    $('<input type="hidden" name="page_url">').val(document.referrer).appendTo('#add_feedback');
  }

  window.index = lunr(function () {
    this.field('name', {boost: 10});
    this.ref('url');
  });

  window.lookup = {};

  var req = $.ajax({
    url: '/search.json'
  });

  req.done(function(collections) {
    $.each(collections, function(i, collection) {
      $.each(collection.docs, function(j, doc) {
        window.lookup[doc.url] = doc.name;
        index.add(doc);
      });
    });
  });
});
