class AddColumnToPhoto2 < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :image, :string, null: false
    add_reference :photos, :post, foreign_key: true, null: false

  end
end
