class AddDescriptionAndKeywordsToPost < ActiveRecord::Migration[6.0]
  def change
  	add_column :posts, :description, :string
  	add_column :posts, :keywords, :string
  end
end
