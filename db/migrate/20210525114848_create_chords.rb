class CreateChords < ActiveRecord::Migration[6.1]
  def change
    create_table :chords do |t|
      t.string :song
      t.string :artist
      t.string :chords
      t.string :page_url

      t.timestamps
    end
  end
end
