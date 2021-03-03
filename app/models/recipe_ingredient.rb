class RecipeIngredient < ApplicationRecord
  attr_reader :ingredient_id, :name
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

  def self.destroy_ingredients(recipe_id)
    # Find all Ingredients with recipe_id of associated recipe that was deleted and delete those ingredient objects upon
    #recipe deletion
    @ri = RecipeIngredient.all.where(recipe_id: recipe_id)
    
    @ri.each do |d|
        d.destroy
    end 
end

end

