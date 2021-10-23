class AddOptionsToSlider < ActiveRecord::Migration[6.1]
  def change
    add_column :sliders, :interval, :integer
    add_column :sliders, :dark, :float
    add_column :sliders, :fade, :boolean
  end
end
