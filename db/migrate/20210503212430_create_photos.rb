class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :name
      t.date :concert_date
      t.boolean :loved, default: false
      t.boolean :liked, default: false 
      t.references :user, foreign_key: true
      t.references :concert, foreign_key: true

      t.timestamps
    end
  end
end
