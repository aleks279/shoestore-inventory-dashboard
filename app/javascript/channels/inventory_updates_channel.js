import consumer from "channels/consumer"

consumer.subscriptions.create("InventoryUpdatesChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected to InventoryUpdatesChannel')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    var updatesTable = document.getElementById('updates');
    var newRow = `
      <tr class='align-left small'>
        <td class='align-left'>${data.store}</td>
        <td class='align-left'>${data.model}</td>
        <td class='align-left'>${data.inventory}</td>
      </tr>
    `;
    updatesTable.insertAdjacentHTML('afterBegin', newRow);
  }
});
