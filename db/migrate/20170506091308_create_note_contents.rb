class CreateNoteContents < ActiveRecord::Migration[5.0]
  def change
    create_table :note_contents do |t|
      t.integer :note_id
      t.decimal :version
      t.text :contents

      t.timestamps
    end
  end
end
