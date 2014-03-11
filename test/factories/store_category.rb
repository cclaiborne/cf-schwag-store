module Shoppe
  FactoryGirl.define do

    factory :phones_category, :class => ProductCategory do
      name 'Phones'
      # permalink 'greatphones'
    end
    
    factory :accessories_category, :class => ProductCategory do
      name 'Accessories'
      # permalink 'acc-stuff'
    end
    
    factory :software_category, :class => ProductCategory do
      name 'Software'
      # permalink 'software'
    end

    factory :category, class: ProductCategory do 
      name "Code Fellows Products"
      permalink "stuff"
      description "Wonderful products from Code Fellows"
    end
     

  end
end

