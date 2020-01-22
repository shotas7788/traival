class AddColumnToPost2 < ActiveRecord::Migration[5.2]
  def change

    add_column :posts, :image, :string, null: false
    add_reference :posts, :user, foreign_key: true, null: false
  end
end
