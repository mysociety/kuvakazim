jQuery(function($) {
  var $searchBox = $('.js-search-autocomplete-name')
  $searchBox.select2();
  $searchBox.change(function(e) {
    window.location.href = $(this).val();
  });
});
