class RankingController < ApplicationController
  
  def have
    # -- type = "Have"を検索してレコードを絞り込み item_idをカウントしグループ化
    #binding.pry  
    @best_items_id=Ownership.where(type: "Have").group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
    @items=Item.find(@best_items_id)
 
    #binding.pry

  end
  
  def want
    @best_items_id=Ownership.where(type: "Want").group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
    @items=Item.find(@best_items_id)
  end
  
end

