class AddCategoryIdToCats < ActiveRecord::Migration
  def change
    add_column :cats, :category_id, :integer
  end
end
