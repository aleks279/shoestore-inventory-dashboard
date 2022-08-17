import consumer from "channels/consumer"

consumer.subscriptions.create("InventoryUpdatesChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected to channel...')
    var ws = new WebSocket('ws://localhost:8080/');

    ws.onmessage = function(event) {
      var data = JSON.parse(event.data);
      console.log(data);
      var updatesTable = document.getElementById('updates');
      var newRow = `
        <tr class='align-left small'>
          <td class='align-left'>${data.store}</td>
          <td class='align-left'>${data.model}</td>
          <td class='align-left'>${data.inventory}</td>
        </tr>
      `;
      updatesTable.insertAdjacentHTML('afterBegin', newRow);
    };
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});
