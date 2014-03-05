Factory.define :product, :class => Shoppe::Product do |f|
  f.parent_id 2
  f.product_category 1
  f.sequence(:name) {|n| "pen_#{n}"}
  f.sequence(:sku) {|n| "xxx_#{n}"}
  f.sequence(:permalink) {"yyy_#{n}"}
  f.description "Another great product from codefellows that will last, last , last"
  f.price 2.00
  f.stock_control true
end
