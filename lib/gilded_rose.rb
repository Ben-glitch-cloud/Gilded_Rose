class GildedRose  

  attr_accessor :item


  def initialize(items)
    @items = items
  end

  def update_quality()

    update_quality_one  

    update_quality_two 

    update_quality_three 

  end     

  def update_quality_one  
    @items.each do |item|   
      if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert"  
        update_quality_one_negitve
      else item.quality < 50   
        item.quality += 1 
        update_quality_one_positve
      end   
    end  
  end   
 
  def update_quality_one_negitve 
    @items.each do |item|   
      if item.name == "Conjured Mana Cake" && item.quality > 0 
        item.quality -= 2
      elsif item.name != "Sulfuras, Hand of Ragnaros" && item.quality > 0 
        item.quality -= 1
      end  
    end  
  end 
  
  def update_quality_one_positve 
    @items.each do |item|
      if item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in < 11 && item.quality < 50
        item.quality += 1  
        item.sell_in < 6 && item.quality < 50 ? item.quality += 1 : nil 
      end 
    end  
  end 

  def update_quality_two   
    @items.each { |item| item.name != "Sulfuras, Hand of Ragnaros" ? item.sell_in -= 1 : nil }
  end  

  def update_quality_three  

    @items.each do |item| 
      if item.name != "Aged Brie" && item.sell_in < 0 && item.name != "Backstage passes to a TAFKAL80ETC concert"  
        item.quality -= 1
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in < 0 
        item.quality -= item.quality
      elsif item.sell_in < 0 && item.quality < 50
         item.quality += 1 
      end
    end   

  end   

end 


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
