class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
     response = {}
    if params[:q]
      response = Amazon::Ecs.item_search(params[:q] , 
                                  :search_index => 'All' , 
                                  :response_group => 'Medium' ,
                                  :country => 'jp')
      @amazon_items = response.items      
    end
  end

  # -- itemページ --
  def show
    @item = Item.find(params[:id])

    @url = @item.detail_page_url
    #binding.pry
  end
  

  private
  def set_item
    @item = Item.find(params[:id])
  end
  
  
end
