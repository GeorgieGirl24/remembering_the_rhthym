class CreateUserConcert < ActiveRecord::Migration[5.2]
  def change
    create_table :user_concerts do |t|
      t.references :user, foreign_key: true
      t.references :concert, foreign_key: true
    end
  end
end
