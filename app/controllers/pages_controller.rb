class PagesController < ApplicationController
  def home
    @equipments = Equipment.all
  end
end
