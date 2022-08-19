import consumer from "channels/consumer"

consumer.subscriptions.create("InventoryAlertsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected to InventoryAlertsChannel')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    var alertsList = document.getElementById('alerts');
    var newElement = `
      <li class='align-left small'>
        [${data.store}] inventory low on [${data.model}] at ${data.inventory}!
      </li>
    `;
    alertsList.insertAdjacentHTML('afterBegin', newElement);
  }
});
