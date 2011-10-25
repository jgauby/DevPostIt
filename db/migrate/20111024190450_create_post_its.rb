class CreatePostIts < ActiveRecord::Migration
  def change
    create_table :post_its do |t|
      t.string :title, :null => false
      t.text :content, :null => false
      t.string :username, :null => false
      t.string :email, :null => false
      t.string :token, :null => false
      t.string :language

      t.timestamps
    end
  end
end
