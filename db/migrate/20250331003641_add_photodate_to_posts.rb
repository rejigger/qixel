class AddPhotodateToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :photodate, :datetime
  end
end
