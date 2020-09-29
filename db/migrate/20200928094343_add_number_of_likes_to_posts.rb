class AddNumberOfLikesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :number_of_likes, :Integer
  end
end
