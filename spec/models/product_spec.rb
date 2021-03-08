require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should successfully create a new product" do
      @category = Category.create(name: 'Clothing')
      @product = @category.products.create(name: 'hoodie', description: 'test', image: 'test', price_cents: 10000, quantity: 10)
      expect(@product).to be_valid
    end
    it "is not valid without a name present" do
      @category = Category.create(name: 'Clothing')
      @product = @category.products.create(name: nil, description: 'test', image: 'test', price_cents: 10000, quantity: 10)
      expect(@product).not_to be_valid
      @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "is not valid without a price present" do
      @category = Category.create(name: 'Clothing')
      @product = @category.products.create(name: 'hoodie', description: 'test', image: 'test', price_cents: nil, quantity: 10)
      expect(@product).not_to be_valid
      @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "is not valid without a quantity present" do
      @category = Category.create(name: 'Clothing')
      @product = @category.products.create(name: 'hoodie', description: 'test', image: 'test', price_cents: 10000, quantity: nil)
      expect(@product).not_to be_valid
      @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "is not valid without a category present" do
      @product = Product.create(name: 'hoodie', description: 'test', image: 'test', price_cents: 10000, quantity: 10)
      expect(@product).not_to be_valid
      @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
