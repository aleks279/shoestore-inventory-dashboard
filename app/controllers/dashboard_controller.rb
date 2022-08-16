class DashboardController < ApplicationController
  def index
    @reports = InventoryReport.all
  end
end
