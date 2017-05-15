require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: 'Shirt', price: 345, quantity: 23, category: @category)
      # Could be also be done as below
      # @product = @category.products.new(name: 'Shirt', price: 345, quantity: 23)
    end
    it 'is not valid without a name' do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'is not valid without a price' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'is not valid without a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'is not valid without a Category' do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it 'is valid with all four fields set' do
      expect(@product).to be_valid
    end
  end
end
