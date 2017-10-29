class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end

    # add indices on the columns we'll sort by later
    add_index :reviews, [:user_id, :restaurant_id, :created_at]
  end
end
