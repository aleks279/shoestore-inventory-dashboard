require_relative "../config/environment"
Rails.application.eager_load!
run ActionCable.server

require 'faye/websocket'
require 'eventmachine'
require 'json'

EM.run {
  ws = Faye::WebSocket::Client.new('ws://localhost:8080/')

  ws.on :message do |event|
    data = JSON.parse(event.data)
    InventoryReportCreator.call(store: data['store'], model: data['model'], inventory: data['inventory'])
  end
}
