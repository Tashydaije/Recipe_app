class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  accepts_nested_attributes_for :ingredient

  def ingredient_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |i|
        if i != ""
            ingredient = Ingredient.find_or_create_by(name: i.downcase, quantity: i.to_s)
            self.ingredient = ingredient
        end 
    end 
end
end
