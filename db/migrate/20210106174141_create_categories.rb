class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.datetime :published_at
      t.string :slug

      t.timestamps
    end
  end
end
