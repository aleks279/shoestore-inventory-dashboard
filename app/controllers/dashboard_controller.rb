class DashboardController < ApplicationController
  def index
    @shoes = Store.all.map { |s| { name: s.name, data: s.shoes.pluck(:model, :inventory) } }
  end
end
