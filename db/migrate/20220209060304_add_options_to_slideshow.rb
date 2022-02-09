class AddOptionsToSlideshow < ActiveRecord::Migration[6.1]
  def change
    add_column :slideshows, :options, :json
  end
end
