class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :category_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.integer :comments_count
      t.integer :likes_count

      t.timestamps
    end
  end
end
