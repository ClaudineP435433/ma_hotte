class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.references :list, foreign_key: true
      t.references :giver
      t.integer :status
      t.string :name
      t.text :description
      t.string :brand
      t.string :link

      t.timestamps
    end
  end
end
