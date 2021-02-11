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
        if item.name != "Sulfuras, Hand of Ragnaros" && item.quality > 0 
          item.name == "Conjured Mana Cake" ? item.quality = item.quality - 2 : item.quality = item.quality - 1 
        end 
      else item.quality < 50  
        item.quality = item.quality + 1 
        if item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in < 11 && item.quality < 50
          item.quality = item.quality + 1  
          item.sell_in < 6 && item.quality < 50 ? item.quality = item.quality + 1 : nil
        end 
      end  
    end  

  end  

  def update_quality_two  
    @items.each do |item|
      item.name != "Sulfuras, Hand of Ragnaros" ? item.sell_in = item.sell_in - 1 : nil  
    end  

  end  

  def update_quality_three  

    @items.each do |item|
      if item.name != "Aged Brie" &&  item.sell_in < 0
        item.name != "Backstage passes to a TAFKAL80ETC concert" && item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros" ? item.quality = item.quality - 1 : item.quality = item.quality - item.quality 
      elsif item.sell_in < 0
        item.quality < 50 ? item.quality = item.quality + 1 : nil
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
