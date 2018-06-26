class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def index
    @lists = List.where(owner: current_user)
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    @gift = Gift.new
  end

  def create
    @list = List.new(list_params)
    @list.owner = current_user
    @list.status = 0
    @list.name = "Ma Liste de Nöel #{current_user.owner_lists.size}"
    if @list.save

      redirect_to new_list_participation_path(@list)
      flash[:notice] = "Votre liste a été créé avec succés"
    else
      render 'lists/new'
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(lists_params)
      flash[:notice] = 'Votre Liste de Noël a bien été mise à jour'
      redirect_to lists_path
    else
      render 'lists/edit'
    end
  end

  private

  def list_params
    params
      .require(:list)
      .permit(:name,:owner_id,
        gifts_attributes: [:id, :_destroy, :name, :description, :brand, :link, images: []])
  end

end
