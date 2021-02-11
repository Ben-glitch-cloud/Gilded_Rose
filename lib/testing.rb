class Test   

    def initialize  
        @item = [1, 2, 3]
    end 

    def mix_number
        Test.new.yes 
        Test.new.no
    end  

    def yes 

        @item.each do |num|
            if num == 1 
                puts "Yes"
            end 
        end  

    end  

    def no  

        @item.each do |num|  
            if num != 1  
                puts "No"
            end 
        end  

    end 

end 

test = Test.new 

test.mix_number 

RSpec.describe do 
    describe Test do 
        describe 'mix_number' do 
            
        end 
    end 
end 
