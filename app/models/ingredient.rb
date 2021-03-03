class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    #belongs_to :recipes
    has_many :recipes, through: :recipe_ingredients

    validates :name, presence: true, uniqueness: true
    before_save { self.name = name.downcase }
    validates :quantity, presence: true

    def self.destroy_ingredients(ingredient_id)
        @r_i = RecipeIngredient.all.where(ingredient_id: ingredient_id)
        
        @r_i.each do |d|
            d.destroy
        end 
    end

end
