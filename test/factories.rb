FactoryGirl.define do
  factory :product, class:  Shoppe::Product do 
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

  factory :category, class:  Shoppe::ProductCategory do 
    name "Code Fellows Products"
    permalink "stuff"
    description "Wonderful products from Code Fellows"
  end
  factory :order, class:  Shoppe::Order do
    first_name "John"
    last_name "Johnson"
    email_address "234me@example.com"
    phone_number "233-222-1212"

    factory :order_with_order_item do
      after(:create ) do |order|
        create(:order_item, order: order)
      end
    end
  end
  factory :order_item, class:  Shoppe::OrderItem do
    quantity 3
    unit_price 3.45
    tax_amount 13.50
    tax_rate 0.085
    weight 5.0
  end
  factory :snom_870, class: Shoppe::Product, :parent => :stock_product do
    name                'Snom 870'
    sku                 'SN870'
    short_description   'An awesome phone which you will absolutely love to use.'
    price               250
    cost_price          125
    weight              2.0
  end

  factory :yealink_headset, class: Shoppe::Product, :parent => :stock_product do
    name                'Yealink Headset'
    sku                 'YHS32'
    short_description   'An awesome headset which you will absolutely love to use.'
    price               40.00
    cost_price          20.00
    weight              0.5
  end 
end
