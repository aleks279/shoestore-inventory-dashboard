require_relative "../config/environment"
Rails.application.eager_load!
run ActionCable.server

require 'faye/websocket'
require 'eventmachine'
require 'json'

EM.run {
  ws = Faye::WebSocket::Client.new('ws://localhost:8080/')

  ws.on :message do |event|
    report = InventoryReport.create!(JSON.parse(event.data).to_hash)

    ActionCable.server.broadcast(
      'InventoryUpdatesChannel',
      {
        store: report.store,
        model: report.model,
        inventory: report.inventory
      }
    )
  end
}
