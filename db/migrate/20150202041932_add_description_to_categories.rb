class AddDescriptionToCategories < ActiveRecord::Migration
  # Some change
  def change
    add_column :categories, :description, :string
  end
end

