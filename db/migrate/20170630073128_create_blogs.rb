class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :category
      t.boolean :isSuggest
      t.string :image
      t.boolean :isPublic
      t.datetime :datePublic
      t.text :body
      t.string :author
      t.string :jobName
      t.integer :age
      t.string :authorImage

      t.timestamps
    end
  end
end
