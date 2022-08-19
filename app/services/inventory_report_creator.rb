class InventoryReportCreator < BaseService
  attr_reader :store, :model, :inventory

  def initialize(store:, model:, inventory:)
    @store = store
    @model = model
    @inventory = inventory
  end

  def call
    new_store = Store.where(name: store).first_or_create!(name: store)
    shoe_model = new_store.shoes.first_or_create(model: model)
    shoe_model.update!(inventory: inventory)

    ActionCable.server.broadcast('InventoryUpdatesChannel', {
                                   store: new_store.name,
                                   model: shoe_model.model,
                                   inventory: shoe_model.inventory
                                 })

    if shoe_model.inventory < 20
      ActionCable.server.broadcast('InventoryAlertsChannel', {
                                     store: new_store.name,
                                     model: shoe_model.model,
                                     inventory: shoe_model.inventory
                                   })
    end
  end
end
