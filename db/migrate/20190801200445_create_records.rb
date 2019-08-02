class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :letter_id
      t.string :name
      t.decimal :unit_value
      t.integer :quantity
      t.integer :template
      t.timestamps
    end
  end
end
