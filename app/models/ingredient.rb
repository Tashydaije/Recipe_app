class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    #belongs_to :recipes
    has_many :recipes, through: :recipe_ingredients

    validates :name, presence: true, uniqueness: true
    before_save { self.name = name.downcase }
    validates :quantity, presence: true

    def self.destroy_ingredients(recipe_id)
        # Find all Ingredients with recipe_id of associated recipe that was deleted and delete those ingredient objects upon
        #recipe deletion
        @ri = RecipeIngredient.all.where(recipe_id: recipe_id)
        
        @ri.each do |d|
            d.destroy
        end 
    end


end
