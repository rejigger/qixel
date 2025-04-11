class RenameLattitudeToLatitudeInPosts < ActiveRecord::Migration[8.0]
  def change
    rename_column :posts, :lattitude, :latitude
  end
end
