FactoryGirl.define do
  factory :item do
    
    sequence :title do |i|
    	"title#{i}"
    end

    sequence :description do |i|
    	"descrip#{i}"
    end
    
    price rand(1.0..1000.0)
    
    image "http://lorempixel.com/400/200"
    
  end
end
