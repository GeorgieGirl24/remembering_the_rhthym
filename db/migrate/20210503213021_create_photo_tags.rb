class CreatePhotoTags < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_tags do |t|
      t.references :photo, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
