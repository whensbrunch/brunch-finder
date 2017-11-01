$( document ).ready(function() {
  console.log('Event listener called');
  $input = $("[data-behavior='autocomplete']");

  var options = {
    getValue: "name",
    url: function(phrase) {
      return "/search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "restaurants",
        header: "<strong>Restaurants</strong>"
      }
    ],
    list: {
      onChooseEvent: function() {
        var id = $input.getSelectedItemData().id
        console.log(id)

        var hiddenField = document.getElementById('review_restaurant_id');
        hiddenField.value = id;
      }
    }
  };

  $input.easyAutocomplete(options);
});
