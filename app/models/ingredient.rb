class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

    validates :name, presence: true
    before_save { self.name = name.downcase }
    validates :quantity, presence: true

    

end
