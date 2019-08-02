class AlterLettersAddUserIdColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :letters, :user_id, :integer
  end
end
