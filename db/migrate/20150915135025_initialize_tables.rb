class InitializeTables < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :author
      t.string :url

      t.timestamps null: false
    end

    create_table :users do |t|
      t.string :username
    end

    create_table :user_tracks do |t|
      t.references :users
      t.references :tracks
    end
  end
end
