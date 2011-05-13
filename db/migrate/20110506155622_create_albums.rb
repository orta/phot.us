class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :description
      t.string :safe_name
      t.string :flickbook_url
      t.string :photographer

      t.timestamps
    end
  end
end
