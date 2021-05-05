class CreateUserPhoto < ActiveRecord::Migration[5.2]
  def change
    create_table :user_photos do |t|
      t.references :user, foreign_key: true
      t.references :photo, foreign_key: true
    end
  end
end
