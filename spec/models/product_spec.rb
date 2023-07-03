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

    it 'is invalide when name is missing' do
      product = Product.new(name: nil)
      expect(product).to_not be_valid
    end

    it 'is invalid when price is missing' do
      product = Product.new(price: nil)
      expect(product).to_not be_valid
    end

    it 'is invalid when quantity is missing' do
      product = Product.new(quantity: nil)
      expect(product).to_not be_valid
    end

    it 'is invalid when category is missing' do
      product = Product.new(category: nil)
      expect(product).to_not be_valid
    end
  end
end
