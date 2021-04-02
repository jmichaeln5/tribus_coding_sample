$(document).ready(function(){

    var csrfToken = document.querySelector('[name=csrf-token]')
    var settings = {
      "url": "/notifications.json",
      "method": "GET",
      'x-csrf-token': csrfToken.content,
      "headers": {
        "cache-control": "no-cache",
      }
    }

    $.ajax(settings).done(function (response) {

      var amountOfNotifications = response.length

      if (amountOfNotifications > 0) {

        var notificationText = (amountOfNotifications >= 1) ? "Notification" : "Notifications";
        var notificationCountText = amountOfNotifications + " New " + notificationText

        $('.notification-count').text(notificationCountText)

        items = $.map( response, function( val, i ) {
          var notificationOutput = `<a class="dropdown-item center" id="new-notification-${i}" href="${val.url}">  ${val.message}  </a>`
          $(notificationOutput).insertAfter("#notification-resp")
        });

        $( "#notifications-nav-dropdown" ).removeClass( "invisible" ).addClass( "visible" );

      }


    });

    let mark_as_read = {
      "url": "/notifications/mark_as_read",
      "method": "POST",
      'x-csrf-token': csrfToken.content,
      "headers": {
        "cache-control": "no-cache",
      }
    }

    $( "#mark-as-read" ).click(function() {

      $.ajax(mark_as_read).done(function (response) {
        console.log(response)
        console.log("marked as read.")
      })
    });

});
