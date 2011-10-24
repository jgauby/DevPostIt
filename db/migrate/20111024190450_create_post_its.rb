class CreatePostIts < ActiveRecord::Migration
  def change
    create_table :post_its do |t|
      t.string :title
      t.text :content
      t.string :username
      t.string :email
      t.string :token
      
      t.references :language

      t.timestamps
    end
  end
end
