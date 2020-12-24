class CreateSliders < ActiveRecord::Migration[6.0]
  def change
    create_table :sliders do |t|
      t.string :name
      t.datetime :published_at

      t.timestamps
    end
  end
end
