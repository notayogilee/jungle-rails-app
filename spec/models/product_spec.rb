require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do 
    @product = Product.new
    @category = Category.new name: 'Furniture'
  end

    it "saves when all fields are filled" do 
      @detailed_product = Product.new(name: 'chair', price: 10000, quantity: 5, category: @category)
      @detailed_product.save!
      expect(@detailed_product).to be_persisted
    end

    it "is not valid without a name" do 
      @product = Product.new(name: nil)
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:name]).to include("can't be blank")
    end

    it "is not valid without a price" do 
      @product = Product.new(price: nil)
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:price]).to include("can't be blank")
    end

    it "is not valid without a quantity" do
      @product = Product.new(quantity: nil)
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:quantity]).to include("can't be blank")
    end
    
    it "is not valid without a category" do
      @product = Product.new(category: nil)
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:category]).to include("can't be blank")
    end
 
end
