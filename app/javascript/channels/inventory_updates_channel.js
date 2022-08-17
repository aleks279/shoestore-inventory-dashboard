import consumer from "channels/consumer"

consumer.subscriptions.create("InventoryUpdatesChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected to channel...')
    var ws = new WebSocket('ws://localhost:8080/');

    ws.onmessage = function(event) {
      var data = JSON.parse(event.data);
      console.log(event.data);
      var updatesElement = document.getElementById('updates');
      updatesElement.innerHTML += `
        <div>
          <h2>${data.store}</h2>
          <p>Shoe model: ${data.model}</p>
          <p>Inventory: ${data.inventory}</p>
        </div>
      `;
    };
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});
