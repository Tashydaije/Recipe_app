class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    #has_many :ingredients, through: :recipe_ingredients

    validates :name, presence: true
    validates :instructions, presence: true
    validates :recipe_ingredients, presence: true

    validates_associated :recipe_ingredients

    accepts_nested_attributes_for :recipe_ingredients, limit: 5,  :reject_if => proc { |attrs| attrs[:ingredient_attributes][:name].blank? || attrs[:ingredient_attributes][:quantity].blank?} #ignore any new record hashes if they fail to pass

   # after_save :update_attribute

   def add_ingredient(ingredient_name)
    ingredient = Ingredient.find(name: ingredient_name)
    self.ingredient = ingredient
  end

end
