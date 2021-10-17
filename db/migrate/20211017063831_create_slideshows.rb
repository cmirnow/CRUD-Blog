class CreateSlideshows < ActiveRecord::Migration[6.1]
  def change
    create_table :slideshows do |t|
      t.string :name
      t.datetime :published_at

      t.timestamps
    end
  end
end
