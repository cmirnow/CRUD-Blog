class AddOptionsToSlideshow < ActiveRecord::Migration[6.1]
  def change
    add_column :slideshows, :options, :string
  end
end
