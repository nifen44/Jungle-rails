require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'is valid with all required attributes' do
      product = Product.new(
        name: 'Example Product',
        price: Money.new(100, 'CAD'),
        quantity: 5,
        category: Category.new
      )
      expect(product).to be_valid
    end

    it 'is invalide without name' do
      product = Product.new(name: nil)
      expect(product).to_not be_valid
    end

    it 'is invalid without a price' do
      product = Product.new(price: nil)
      expect(product).to_not be_valid
    end

    it 'is invalid without a quantity' do
      product = Product.new(quantity: nil)
      expect(product).to_not be_valid
    end

    it 'is invalid without a category' do
      product = Product.new(category: nil)
      expect(product).to_not be_valid
    end
  end
end
