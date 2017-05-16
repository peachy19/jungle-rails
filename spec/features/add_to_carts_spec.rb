require 'rails_helper'

RSpec.feature "Add to cart", type: :feature, js: true do
 # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "When user adds a product, the cart value increases by 1" do
    visit '/'
    first('article.product').find_link('Add').click
    save_screenshot 'cart_testing.png'
    expect(page).to have_text("My Cart (1)")
  end
end
