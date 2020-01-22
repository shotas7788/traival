class ChangePosts < ActiveRecord::Migration[5.2]
  def change
    
    change_table :posts do |t|
      t.rename :image, :caption
    end
    
  end
end
