class PagesController < ApplicationController
  def home
    @equipment = Equipment.new
  end
end
