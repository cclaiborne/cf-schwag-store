FactoryGirl.define do
  factory :product, :class => Shoppe::Product do 
    # product_category 2 
    name  "Pen"  
    sku 'ABCdefG'
    permalink "yyy"
    description "Another great product from codefellows that will last, last , last"
    price  2.00 
    stock_control true
    short_description "Just amazingly cool stuff"
    product_category_id  56
    default true
  end

  factory :category, :class => Shoppe::ProductCategory do |f|
    name "Code Fellows Products"
    permalink "stuff"
    description "Wonderful products from Code Fellows"
  end
end
