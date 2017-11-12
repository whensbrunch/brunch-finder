$( document ).ready(function() {
  console.log('Event listener called for find');
  $find = $("[data-behavior='find']");

  var options = {

    url: function(phrase) {
      return "/find.json?q=" + phrase;
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
        var id = $find.getSelectedItemData().id
        console.log(id)

        // place it in hidden field
        var hiddenField = document.getElementById('find_restaurant_id');
        hiddenField.value = id;
      }
    }
  };

  $find.easyAutocomplete(options);
});
