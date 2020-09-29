class AddLikesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :post, index: true, foreign_key: true
    
  end
end
