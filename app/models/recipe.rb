class Recipe < ApplicationRecord
    belongs_to :user

    validates :name, presence: true
    validates :instructions, presence: true
    validates :ingredients, presence: true
end
