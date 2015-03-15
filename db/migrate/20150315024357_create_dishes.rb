class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.string :vote
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
