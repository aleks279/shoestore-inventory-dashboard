class InventoryUpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'InventoryUpdatesChannel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    p data
  end
end
