#require File.join(File.dirname(__FILE__), 'gilded_rose') 
require 'gilded_rose'

describe GildedRose do 

  

  describe "#update_quality" do 

    #name of items 

    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq("foo")
    end  

    #sell in of items 

    it 'does not change the sell_in' do 
      item = [Item.new("foo", 4, 0)] 
      GildedRose.new(item).update_quality() 
      expect(item[0].sell_in).to eq(3)
    end   

    #quality of items 

    it 'quality reduces by one each day' do 
      item = [Item.new("foo", 5, 5)] 
      GildedRose.new(item).update_quality() 
      expect(item[0].quality).to eq(4)
    end    

    #quality does not go below zero

    it 'quality does not go into the negitve' do 
      item = [Item.new("foo", 5, 0)] 
      GildedRose.new(item).update_quality() 
      expect(item[0].quality).to eq(0)
    end 

    #testing products from here 

    it 'Aged Brie should increase in quality' do  
      item = [Item.new("Aged Brie", 2, 0)] 
      GildedRose.new(item).update_quality() 
      expect(item[0].quality).to eq(1)
    end   

    it 'Backstage passes should increase in quality by 2 after 10 days or less' do 
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)] 
      GildedRose.new(item).update_quality() 
      expect(item[0].quality).to eq(22)
    end  

    it 'Backstage passes should increase in quality by 3 after 5 days or less' do 
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20)] 
      GildedRose.new(item).update_quality() 
      expect(item[0].quality).to eq(23)
    end 

    it 'Backstage passes quality should drop to zero when the consent is finished' do 
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20)] 
      GildedRose.new(item).update_quality() 
      expect(item[0].quality).to eq(0)
    end  

    # testing non perishable items  

    it 'Sulfures, Hand of Ragaros should not reduce in quality' do
      item = [Item.new("Sulfuras, Hand of Ragnaros", 0, 49)] 
      GildedRose.new(item).update_quality() 
      expect(item[0].quality).to eq(49)
    end 

    # testing Conjured items 

    it 'Conjured Mana Cake should decrease quality twise as fast' do 
      item = [Item.new("Conjured Mana Cake", 10, 10)] 
      GildedRose.new(item).update_quality() 
      expect(item[0].quality).to eq(8)
    end 

  end
end
