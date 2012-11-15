class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.boolean :watched
      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
