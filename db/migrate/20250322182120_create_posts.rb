class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.integer :userid
      t.decimal :longitude, precision: 8, scale:6
      t.decimal :lattitude, precision: 9, scale:6
      t.timestamp :posttime
      t.string :title
      t.integer :commentid
      t.text :comment

      t.timestamps
    end
  end
end
