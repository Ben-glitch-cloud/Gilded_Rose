@items.each do |item|
    if item.name != "Aged Brie" &&  item.sell_in < 0 
        
      item.name != "Backstage passes to a TAFKAL80ETC concert" && item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros" ? item.quality = item.quality - 1 : item.quality = item.quality - item.quality  

    elsif item.sell_in < 0 

      item.quality < 50 ? item.quality = item.quality + 1 : nil
    end  
  end  
