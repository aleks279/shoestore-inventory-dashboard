class InventoryReportCreator
  attr_reader :store, :model, :inventory

  def initialize(store:, model:, inventory:)
    @store = store
    @model = model
    @inventory = inventory
  end

  def create
    update = InventoryReport.create!(store: @store, model: @model, inventory: @inventory)

    ActionCable.server.broadcast('InventoryUpdatesChannel', {
      id: update.id,
      store: update.store,
      model: update.model,
      inventory: update.inventory
    })
  end
end
