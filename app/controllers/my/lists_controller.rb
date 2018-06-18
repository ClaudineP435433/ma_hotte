class My::ListsController < ApplicationController

  def create
    @list = List.new(list_params)
    @list.owner = current_user
    @list.default_status

    @gift = @list.gifts.new

    if @list.save
      redirect_to new_my_list_participation(@list)
      flash[:notice] = "Votre liste a été créé avec succés"
    else
      render 'pages/home'
    end
  end

  private

  def list_params
    params.require(:list).permit(
      :name,
      :owner_id
    )
  end

end
