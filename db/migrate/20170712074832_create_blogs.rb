class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.integer :category_id
      t.integer :isSuggest
      t.integer :isPublic
      t.string :image
      t.datetime :dataPublic
      t.text :content
      t.string :author
      t.string :jobName
      t.integer :age
      t.string :authorImage
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
