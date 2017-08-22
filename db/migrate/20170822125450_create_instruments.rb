class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :instruments do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :description
      t.string :category
      t.boolean :availibility
      t.integer :price

      t.timestamps
    end
  end
end
