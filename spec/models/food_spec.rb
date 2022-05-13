require 'rails_helper'

RSpec.describe Food, type: :model do
  describe "Create food Validations" do
    it "must contain a dishname" do
        food = Food.create genre: "Japanese", category: "breakfast", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwwQumXHqcpaEIk9qYGTZJGc3HmMKnwGBd_uJiq9JsUXlahU7QezZXooEFQ-ZTNLkiD-E&usqp=CAU"
        expect(food.errors[:dishname]).to_not be_empty
    end
    it "must contain a genre" do
      food = Food.create dishname: "egg sandwich", category: "breakfast", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwwQumXHqcpaEIk9qYGTZJGc3HmMKnwGBd_uJiq9JsUXlahU7QezZXooEFQ-ZTNLkiD-E&usqp=CAU"
      expect(food.errors[:genre]).to_not be_empty
    end
    it "must contain a category" do
      food = Food.create dishname: "egg sandwich", category: "breakfast", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwwQumXHqcpaEIk9qYGTZJGc3HmMKnwGBd_uJiq9JsUXlahU7QezZXooEFQ-ZTNLkiD-E&usqp=CAU"
      expect(food.errors[:genre]).to_not be_empty
    end
    it "must contain an image" do
      food = Food.create dishname: "egg sandwich", category: "breakfast"
      expect(food.errors[:image]).to_not be_empty
    end
  end
end
