class My::ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.owner = current_user
    @list.default_status

    if @list.save
      redirect_to my_list_participation(@list)
      flash[:notice] = "Votre liste a été créé avec succés"
    else
      render 'my/lists#new'
    end
  end

  private

  def list_params
    params
      .require(:list)
      .permit(:name,:owner_id,
        gifts_attributes: [:id, :_destroy, :name, :description, :brand, :link])
  end

end
