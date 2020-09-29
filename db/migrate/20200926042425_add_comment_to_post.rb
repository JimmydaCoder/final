class AddCommentToPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :post_id

    add_reference :comments, :post, index: true, foreign_key: true
    add_reference :comments, :user, index: true, foreign_key: true




  end
end
