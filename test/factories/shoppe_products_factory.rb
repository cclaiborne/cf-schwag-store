FactoryGirl.define do
  factory :product, :class => Shoppe::Product do |f|
    f.id 
    f.parent_id [1..5000].sample
    # f.product_category 65602900 
    f.name { %w[Pen Water-Bottle T-Shirt Code-Book].sample } 
    f.sku 'ABC%d'
    f.permalink {"yyy"}
    f.description "Another great product from codefellows that will last, last , last"
    # f.price  200 
    f.stock_control true
    f.short_description "Just amazingly cool stuff"
    f.product_category_id 1
  end

  factory :category, :class => Shoppe::ProductCategory do |f|
    f.name "Code Fellows Products"
    f.permalink "stuff"
    f.description "Wonderful products from Code Fellows"
  end
end
