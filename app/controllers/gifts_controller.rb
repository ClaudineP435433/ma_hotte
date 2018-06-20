class GiftsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @gifts = Gift.where(giver: current_user)
  end

end
