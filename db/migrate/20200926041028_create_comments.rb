class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment_body
      t.string :username
      t.timestamps

     
    end
  end
end
