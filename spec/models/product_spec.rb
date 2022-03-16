require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    before :each do 
      @product = Product.new
      @category = Category.create(:name => "Apparel")
      @product.name = "product A"
      @product.quantity = 100
      @product.category = @category
    end
    it "saves product when name, price, quantity, category provided" do
      @product.price = 10
      @product.save
      expect(@product.id).not_to be_nil
      
    
    end
    it "does not save product when name is empty" do 
      @product.name = ""
      @product.save
      expect(@product.id).to be_nil
      expect(@product.errors.full_messages).to include("Name can't be blank")

  end
    it "does not save product when price is empty" do
      @product.price = nil
      @product.save
      expect(@product.id).to be_nil
      expect(@product.errors.full_messages).to include("Price can't be blank" )
     
    end
    it "does not save product when quantity is empty" do
      @product.quantity = nil
      @product.save
      expect(@product.id).to be_nil
      expect(@product.errors.full_messages).to include("Quantity can't be blank" )
   

    end
    it "does not save product when category is empty" do
      @product.category = nil
      @product.save
      expect(@product.id).to be_nil
      expect(@product.errors.full_messages).to include("Category can't be blank" )
    end
  end 
end
