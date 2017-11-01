$( document ).ready(function() {
  console.log('Event listener called');
  $input = $("[data-behavior='autocomplete']");

  var options = {

    url: function(phrase) {
      return "/search.json?q=" + phrase;
    },

    getValue: "name",

    template: {
         type: "description",
         fields: {
             description: "address"
         }
     },

    categories: [
      {
        listLocation: "restaurants",
        // header: "<strong>Restaurants</strong>"
      }
    ],

    list: {
      onChooseEvent: function() {
        // get id of user selection
        var id = $input.getSelectedItemData().id
        console.log(id)

        // place it in hidden field
        var hiddenField = document.getElementById('review_restaurant_id');
        hiddenField.value = id;
      }
    }
  };

  $input.easyAutocomplete(options);
});
