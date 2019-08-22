class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    if params[:style]
      @equipments = policy_scope(Equipment.where(style: params[:style]))
    else
      @equipments = policy_scope(Equipment)
    end
  end
end
