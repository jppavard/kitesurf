class PagesController < ApplicationController
  def home
    @equipment = Equipment.new
    @user = current_user
  end
end
