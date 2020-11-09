class Notifications {
  constructor() {
    this.handleClick = this.handleClick.bind(this);
    this.handleSuccess = this.handleSuccess.bind(this);
    this.notifications = $("[data-behavior='notifications']");
    if (this.notifications.length > 0) { this.setup(); }
  }

  setup() {
    $("[data-behavior='notifications-link']").on("click", this.handleClick);
    return $.ajax({
      url: "/notifications.json",
      dataType: "JSON",
      method: "GET",
      success: this.handleSuccess
    });
  }
  
  handleClick(e) {
    return $.ajax({
      url: "/notifications/mark_as_read",
      dataType: "JSON",
      method: "POST",
      success() {
        return $("[data-behavior='unread-count']").text(0);
      }
    });
  }

  handleSuccess(data) {
    const items = $.map(data, notification => `<a class='dropdown-item' href='${notification.url}'>${notification.actor} ${notification.action} ${notification.notifiable.type}</a>`);

    $("[data-behavior='unread-count']").text(items.length);
    return $("[data-behavior='notification-items']").html(items);
  }
}

window.addEventListener("turbolinks:load", jQuery(() => new Notifications));