class RankingController < ApplicationController
  
  def ranking
  end
  
  def have
    # -- type = "Have"を検索してレコードを絞り込み item_idをカウントしグループ化
    #@best_items_id=Ownership.where(type: "Have").group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
  
    # -- 生SQLを書いてみました　--
    @items=Item.find_by_sql('select items.id, item_id, title, asin, large_image, type, count(item_id) from ownerships join items on ownerships.item_id = items.id  GROUP BY item_id, items.id, title, asin,large_image, type HAVING type = "Have" order by count(item_id) desc')
    

    #@items=Item.find(@best_items_id)

    #binding.pry

  end
  
  def want
    #@best_items_id=Ownership.where(type: "Want").group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
    #@items=Item.find(@best_items_id)
    
    # --- 生SQLを書いてみました　--
   @items=Item.find_by_sql('select items.id, item_id, title, asin, large_image, type, count(item_id) from ownerships join items on ownerships.item_id = items.id  GROUP BY item_id, items.id, title, asin,large_image, type HAVING type = "Want" order by count(item_id) desc')
  end
  
end

