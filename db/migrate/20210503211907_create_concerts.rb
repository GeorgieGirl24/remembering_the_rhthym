class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.string :band_name
      t.string :venue
      t.date :concert_date

      t.timestamps
    end
  end
end
