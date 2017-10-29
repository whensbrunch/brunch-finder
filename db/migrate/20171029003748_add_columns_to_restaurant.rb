class AddColumnsToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :price, :string
    add_column :restaurants, :review_count, :integer
    add_column :restaurants, :rating, :float
    add_column :restaurants, :barrio, :string
  end
end
