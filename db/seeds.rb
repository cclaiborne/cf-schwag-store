# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Clean tables before seed
Shoppe::Product.delete_all
Shoppe::ProductCategory.delete_all
Shoppe::ProductAttribute.delete_all
Shoppe::ProductAttribute.delete_all
Shoppe::Order.delete_all
Shoppe::OrderItem.delete_all
Shoppe::DeliveryService.delete_all
Shoppe::TaxRate.delete_all


# tax rates
tax_rate = Shoppe::TaxRate.create!(:name => "Sales Tax", :rate => 0.095)

# delivery services
ds = Shoppe::DeliveryService.create!(:name => "Slow Delivery", :code => 'SLO', :courier => 'USPS', :tracking_url => 'http://trackingurl.com/track/{{consignment_number}}')
ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 0, :max_weight => 1, :price => 5.0, :cost_price => 4.50, :tax_rate => tax_rate)
ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 1, :max_weight => 5, :price => 8.0, :cost_price => 7.5, :tax_rate => tax_rate)
ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 5, :max_weight => 20, :price => 10.0, :cost_price => 9.50, :tax_rate => tax_rate)

ds = Shoppe::DeliveryService.create!(:name => "Two-Day Delivery", :code => 'TWO', :courier => 'FedEx', :tracking_url => 'http://trackingurl.com/track/{{consignment_number}}')
ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 0, :max_weight => 1, :price => 27.0, :cost_price => 24.00, :tax_rate => tax_rate)
ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 1, :max_weight => 5, :price => 29.0, :cost_price => 20.00, :tax_rate => tax_rate)
ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 5, :max_weight => 20, :price => 37.0, :cost_price => 32.00,:tax_rate => tax_rate)

# categories
cat1 = Shoppe::ProductCategory.create!(:name => 'Code Fellows Swag')
cat2 = Shoppe::ProductCategory.create!(:name => 'Competencies Maps')



def get_file(name, content_type = 'image/jpeg')
  file = ActionDispatch::Http::UploadedFile.new(:tempfile => File.open(File.join(File.expand_path('../../app/assets/images', __FILE__), name), 'rb'))
  file.original_filename = name
  file.content_type = content_type
  file
end

lorem = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit,
  sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
  nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
  reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
  officia deserunt mollit anim id est laborum.'

shirt_description = 'An awesome shirt for all of the budding developers in your family.  This shirt
  is 100% cotton, has a unique graphic, and provides that extra cool-factor.'

#Grey Shirts
product = cat1.products.create!(
  :name => 'Shirt',
  :sku => 'SH-001',
  :description => shirt_description,
  :short_description => 'The original Code Fellows tee.',
  :permalink => 'grey-shirt',
  :weight => 0.777,
  :price => 10.99,
  :cost_price => 9.99,
  :tax_rate => tax_rate,
  :featured => true)
product.default_image_file = get_file('square_photo_0.jpg')
product.save!
product.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 5)
product.product_attributes.create!(:key => 'Brand', :value => 'Code Fellows', :position => 1)
product.product_attributes.create!(:key => 'Color', :value => 'Grey', :position => 1)
product.product_attributes.create!(:key => 'Material', :value => 'Cotton', :position => 1)

#Black Shirts
product = cat1.products.create!(
  :name => 'Shirt',
  :sku => 'SH-002',
  :description => shirt_description,
  :short_description => 'The original Code Fellows tee.',
  :permalink => 'black-shirt',
  :weight => 0.777,
  :price => 10.99,
  :cost_price => 9.99,
  :tax_rate => tax_rate,
  :featured => true)
product.default_image_file = get_file('square_photo_1.jpg')
product.save!
product.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 5)
product.product_attributes.create!(:key => 'Brand', :value => 'Code Fellows', :position => 1)
product.product_attributes.create!(:key => 'Color', :value => 'Black', :position => 1)
product.product_attributes.create!(:key => 'Material', :value => 'Cotton', :position => 1)

#Red Shirts
product = cat1.products.create!(
  :name => 'Shirt',
  :sku => 'SH-003',
  :description => shirt_description,
  :short_description => 'The original Code Fellows tee.',
  :permalink => 'red-shirt',
  :weight => 0.777,
  :price => 10.99,
  :cost_price => 9.99,
  :tax_rate => tax_rate,
  :featured => true)
product.default_image_file = get_file('square_photo_2.jpg')
product.save!
product.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 5)
product.product_attributes.create!(:key => 'Brand', :value => 'Code Fellows', :position => 1)
product.product_attributes.create!(:key => 'Color', :value => 'Red', :position => 1)
product.product_attributes.create!(:key => 'Material', :value => 'Cotton', :position => 1)

#Note books
product = cat1.products.create!(
  :name => 'Note Book',
  :sku => 'NB-001',
  :description => "A stylish note book with lined pages, bound with an imitation-leather
  back that provides a solid grip. A nifty elastic band keeps the notebook closed while not
  in use. A red, stamped Code Fellows badge is printed on the cover. All coders can utilize
  this book for pre-planning their classes for their object-oriented programs.  If you're using
  Rails, you can diagram your models, views, and controllers.",
  :short_description => "Code Fellows branded notebook.",
  :permalink => '',
  :weight => 0.10,
  :price => 1.99,
  :cost_price => 1.00,
  :tax_rate => tax_rate,
  :featured => true)
product.default_image_file = get_file('square_photo_3.jpg')
product.save!
product.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 5)
product.product_attributes.create!(:key => 'Brand', :value => 'Code Fellows', :position => 1)
product.product_attributes.create!(:key => 'Color', :value => 'White', :position => 1)
product.product_attributes.create!(:key => 'Material', :value => 'Plastic', :position => 1)

#Pens
product = cat1.products.create!(
  :name => 'Pen',
  :sku => 'P-001',
  :description => "This is the best writing pen for the programmer in your family.  This thing has a perfectly
  calibrated ball point that applies ink to all type of paper that support capillary action.",
  :short_description => "Code Fellows branded programmer's pen",
  :permalink => 'pen',
  :weight => 0.05,
  :price => 1.99,
  :cost_price => 1.00,
  :tax_rate => tax_rate,
  :featured => true)
product.default_image_file = get_file('square_photo_4.jpg')
product.save!
product.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 5)
product.product_attributes.create!(:key => 'branded', :value => 'Code Fellows', :position => 1)
product.product_attributes.create!(:key => 'Color', :value => 'White', :position => 1)
product.product_attributes.create!(:key => 'Material', :value => 'Plastic', :position => 1)
product.product_attributes.create!(:key => 'Type', :value => 'Ballpoint', :position => 1)

#Water Bottles
product = cat1.products.create!(
  :name => 'Water Bottle',
  :sku => 'WB-001',
  :description => "An aluminum water bottle with a sweet Code Fellows badge graphic, sure to make
  any programmer in your family burst at the seams with joy upon receipt.",
  :short_description => "Code Fellows branded water bottle.",
  :permalink => 'water-bottle',
  :weight => 0.10,
  :price => 1.99,
  :cost_price => 1.00,
  :tax_rate => tax_rate,
  :featured => true)
product.default_image_file = get_file('square_photo_5.jpg')
product.save!
product.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 5)
product.product_attributes.create!(:key => 'Brand', :value => 'Code Fellows', :position => 1)
product.product_attributes.create!(:key => 'Color', :value => 'Grey', :position => 1)
product.product_attributes.create!(:key => 'Material', :value => 'Aluminum', :position => 1)


#Map
product = cat2.products.create!(
  :name => 'Rails Poster',
  :sku => 'POSTER-001',
  :description => "An awesome poster that maps out the facets of the Ruby on Rails framework.
  Every Rails developer should be familiar with these concepts and be able to explain their
  purposes. This is also a great reference when you can remember the name of a command.  Hang
  this poster near your workspace for quick reference.  After all, there are only two things that
  are difficult in Rails: naming conventions, rake commands, and off-by-one errors.",
  :short_description => "Code Fellows branded notebook.",
  :permalink => '',
  :weight => 0.10,
  :price => 5.99,
  :cost_price => 3.99,
  :tax_rate => tax_rate,
  :featured => true)
product.default_image_file = get_file('square_rails_mind_map.jpg')
product.save!
product.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 5)
product.product_attributes.create!(:key => 'Brand', :value => 'Code Fellows', :position => 1)
product.product_attributes.create!(:key => 'Color', :value => 'White', :position => 1)
product.product_attributes.create!(:key => 'Material', :value => 'Plastic', :position => 1)



# pro = cat1.products.create!(:name => 'Yealink T22P', :sku => 'YL-SIP-T22P', :description => lorem, :short_description => lorem, :weight => 1.419, :price => 64.99, :cost_price => 56.99, :tax_rate => tax_rate)
# pro.default_image_file = get_file('t22p.jpg')
# pro.save!
# pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 200)
# pro.product_attributes.create!(:key => 'Manufacturer', :value => 'Yealink', :position => 1)
# pro.product_attributes.create!(:key => 'Model', :value => 'T22P', :position => 1)
# pro.product_attributes.create!(:key => 'Colour', :value => 'Black', :position => 1)
# pro.product_attributes.create!(:key => 'Lines', :value => '4', :position => 1)
# pro.product_attributes.create!(:key => 'Colour Screen?', :value => 'No', :position => 1)
# pro.product_attributes.create!(:key => 'Power over ethernet?', :value => 'Yes', :position => 1)


# pro = cat1.products.create!(:name => 'Yealink T26P', :sku => 'YL-SIP-T26P', :description => lorem, :short_description => lorem, :weight => 2.23, :price => 88.99, :cost_price => 78.99, :tax_rate => tax_rate)
# pro.default_image_file = get_file('t26p.jpg')
# pro.save!
# pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 100)
# pro.product_attributes.create!(:key => 'Manufacturer', :value => 'Yealink', :position => 1)
# pro.product_attributes.create!(:key => 'Model', :value => 'T26P', :position => 1)
# pro.product_attributes.create!(:key => 'Colour', :value => 'Black', :position => 1)
# pro.product_attributes.create!(:key => 'Lines', :value => '6', :position => 1)
# pro.product_attributes.create!(:key => 'Colour Screen?', :value => 'No', :position => 1)
# pro.product_attributes.create!(:key => 'Power over ethernet?', :value => 'Yes', :position => 1)

# pro = cat1.products.create!(:name => 'Yealink T46GN', :sku => 'YL-SIP-T46GN', :description => lorem, :short_description => 'Colourful, sharp, fast & down right sexy. The Yealink T46P will make your scream!', :weight => 2.23, :price => 149.99, :cost_price => 139.99, :tax_rate => tax_rate, :featured => true)
# pro.default_image_file = get_file('t46gn.jpg')
# pro.save!
# pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 10)
# pro.product_attributes.create!(:key => 'Manufacturer', :value => 'Yealink', :position => 1)
# pro.product_attributes.create!(:key => 'Model', :value => 'T46GN', :position => 1)
# pro.product_attributes.create!(:key => 'Colour', :value => 'Black', :position => 1)
# pro.product_attributes.create!(:key => 'Lines', :value => '4', :position => 1)
# pro.product_attributes.create!(:key => 'Colour Screen?', :value => 'Yes', :position => 1)
# pro.product_attributes.create!(:key => 'Power over ethernet?', :value => 'Yes', :position => 1)

# pro = cat1.products.create!(:name => 'Snom 870', :sku => 'SM-870', :description => lorem, :short_description => 'The perfect & beautiful VoIP phone for the discerning professional desk.', :featured => true)
# pro.default_image_file = get_file('snom-870-grey.jpg')
# pro.save!
# pro.product_attributes.create!(:key => 'Manufacturer', :value => 'Snom', :position => 1)
# pro.product_attributes.create!(:key => 'Model', :value => '870', :position => 1)
# pro.product_attributes.create!(:key => 'Colour', :value => 'Grey', :position => 1)
# pro.product_attributes.create!(:key => 'Lines', :value => '10', :position => 1)
# pro.product_attributes.create!(:key => 'Colour Screen?', :value => 'Yes', :position => 1)
# pro.product_attributes.create!(:key => 'Power over ethernet?', :value => 'Yes', :position => 1)

# v1 = pro.variants.create(:name => "White/Grey", :sku => "SM-870-GREY", :price => 230.00, :cost_price => 220, :tax_rate => tax_rate, :weight => 1.35, :default => true)
# v1.default_image_file = get_file('snom-870-grey.jpg')
# v1.save!
# v1.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 4)


# v2 = pro.variants.create(:name => "Black", :sku => "SM-870-BLK", :price => 230.00, :cost_price => 220, :tax_rate => tax_rate, :weight => 1.35)
# v2.default_image_file = get_file('snom-870-blk.jpg')
# v2.save!
# v2.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 2)


# pro = cat2.products.create!(:name => 'Yealink Mono Headset', :sku => 'YL-YHS32', :description => lorem, :short_description => 'If you\'re often on the phone, this headset will make your life 100x easier. Guaranteed*.', :weight => 0.890, :price => 34.99, :cost_price => 24.99, :tax_rate => tax_rate, :featured => true)
# pro.default_image_file = get_file('yhs32.jpg')
# pro.save!
# pro.product_attributes.create!(:key => 'Manufacturer', :value => 'Yealink', :position => 1)
# pro.product_attributes.create!(:key => 'Model', :value => 'YHS32', :position => 1)

# pro = cat2.products.create!(:name => 'Snom Wired Headset (MM2)', :sku => 'SM-MM2', :description => lorem, :short_description => lorem, :weight => 0.780, :price => 38.00, :cost_price => 30, :tax_rate => tax_rate)
# pro.default_image_file = get_file('snom-mm2.jpg')
# pro.save!
# pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 7)
# pro.product_attributes.create!(:key => 'Manufacturer', :value => 'Snom', :position => 1)
# pro.product_attributes.create!(:key => 'Model', :value => 'MM2', :position => 1)

# pro = cat2.products.create!(:name => 'Snom Wired Headset (MM3)', :sku => 'SM-MM3', :description => lorem, :short_description => lorem, :weight => 0.780, :price => 38.00, :cost_price => 30, :tax_rate => tax_rate)
# pro.default_image_file = get_file('snom-mm2.jpg')
# pro.save!
# pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 5)
# pro.product_attributes.create!(:key => 'Manufacturer', :value => 'Snom', :position => 1)
# pro.product_attributes.create!(:key => 'Model', :value => 'MM3', :position => 1)

# pro = cat1.products.create!(:name => 'Yealink W52P', :sku => 'TL-SIP-W52P', :description => lorem, :short_description => 'Wireless SIP phones are hard to come by but this beauty from Yealink is fab.', :weight => 1.280, :price => 99.99, :cost_price => 89.99, :tax_rate => tax_rate, :featured => true)
# pro.default_image_file = get_file('w52p.jpg')
# pro.save!
# pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 10)
# pro.product_attributes.create!(:key => 'Manufacturer', :value => 'Snom', :position => 1)
# pro.product_attributes.create!(:key => 'Model', :value => 'W52P', :position => 1)
# pro.product_attributes.create!(:key => 'Lines', :value => '3', :position => 1)
# pro.product_attributes.create!(:key => 'Colour Screen?', :value => 'Yes', :position => 1)
# pro.product_attributes.create!(:key => 'Power over ethernet?', :value => 'No', :position => 1)
