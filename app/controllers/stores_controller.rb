class StoresController < ApplicationController

  def index

  end


  def create
    @store = Store.new(store_params)
    @store.user_id = current_user.id
    if @store.save
      redirect_to stores_path :notice => "Post successfully created"
    else
      puts "An error occured"
    end
  end

  # def create
  #   # @store =  Store.create(store_params)
  #   binding.pry
  #   @store = current_user.store.new(store_params)
  #   @store.save
  #   puts "Store added successfully"
  #   redirect_to stores_path
  # end

  def store_params
    params.require(:store).permit(:storename)
  end
end
