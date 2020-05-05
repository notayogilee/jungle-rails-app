require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do 
    @product = Product.new
    @category = Category.new name: 'Furniture'
  end

    xit "saves when all fields are filled" do 
      @detailed_product = Product.new(name: 'chair', price: 10000, quantity: 5, category: @category)
      @detailed_product.save!
      expect(@detailed_product).to be_persisted
    end

    xit "is not valid without a name" do 
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:name]).to include("can't be blank")
    end

    xit "is not valid without a price" do 
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:price]).to include("can't be blank")
    end

    xit "is not valid without a quantity" do
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:quantity]).to include("can't be blank")
    end
    
    xit "is not valid without a category" do
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:category]).to include("can't be blank")
    end
 
end
