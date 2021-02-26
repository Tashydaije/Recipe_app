class AddUsersToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :user, index: true, foreign_key: true
  end
end
