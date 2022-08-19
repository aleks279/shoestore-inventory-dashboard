class InventoryAlertsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'InventoryAlertsChannel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    p data
  end
end
