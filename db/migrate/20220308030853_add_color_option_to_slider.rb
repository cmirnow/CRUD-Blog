class AddColorOptionToSlider < ActiveRecord::Migration[6.1]
  def change
    add_column :sliders, :color, :string
  end
end
