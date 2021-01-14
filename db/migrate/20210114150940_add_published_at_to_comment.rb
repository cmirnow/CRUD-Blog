class AddPublishedAtToComment < ActiveRecord::Migration[6.0]
  def change
  	add_column :comments, :published_at, :datetime
  end
end
