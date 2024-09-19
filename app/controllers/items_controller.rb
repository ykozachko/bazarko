class ItemsController < ApplicationController
  def index
    # @greeting = "Ahojte vsetci!".upcase
    @items = Item.all
  end
end