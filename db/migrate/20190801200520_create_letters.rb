class CreateLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :letters do |t|
        t.string :letter_number
  
      t.timestamps
    end
  end
end


