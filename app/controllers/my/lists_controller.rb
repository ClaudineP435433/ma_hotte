class My::ListsController < ApplicationController
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
    @list.default_status
    @list.default_name

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
