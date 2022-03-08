class AddCaptionsToSlider < ActiveRecord::Migration[6.1]
  def change
    add_column :sliders, :captions, :text
  end
end
