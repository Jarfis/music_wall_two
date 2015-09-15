class ModifyUserTableAddLoginCred < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :password
    end
  end
end
