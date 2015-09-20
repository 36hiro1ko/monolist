class RankingController < ApplicationController
  
  def ranking
  end
  
  def have
    # -- type = "Have"を検索してレコードを絞り込み item_idをカウントしグループ化
    #best_items_id=Ownership.where(type: "Have").group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
  
    # -- 分からないので生SQLを書いてみました　--
    @items=Item.find_by_sql('select *,count(item_id) AS item_id_count from ownerships join items ON ownerships.item_id = items.id where type = \'Have\' group by item_id order by count(item_id) desc')
    
    #@items=Item.find(@best_items_id)

    #binding.pry

  end
  
  def want
    # @best_items_id=Ownership.where(type: "Want").group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
    # @items=Item.find(@best_items_id)
    
    # -- 分からないので生SQLを書いてみました　--
    @items=Item.find_by_sql('select *, count(item_id) AS item_id_count from ownerships join items ON ownerships.item_id = items.id where type = \'Want\' group by item_id order by count(item_id) desc')
  end
  
end

