import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },
  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  received(data) {
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
      // // One notification to alert amount of Notifications
      var amountOfNotifications = response.length
      var notificationText = (amountOfNotifications > 1) ? "Notifications" : "Notification";

      var title = "YouTubeScraper"
      var body = amountOfNotifications + " New " + notificationText
      var options = { body: body }
      new Notification(title, options)

      // // Multiple individual Notifications

      // items = $.map( response, function( val, i ) {
      //     var title = notificationTitle
      //     var body = `${val.message.substring(0,80)}...`
      //     var options = { body: body }
      //
      //     new Notification(title, options)
      // })

    });
  }
});
