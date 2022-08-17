class InventoryUpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "InventoryUpdatesChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
