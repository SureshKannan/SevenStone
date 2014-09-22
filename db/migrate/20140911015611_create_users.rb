class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "firstname",:limit=>100,:null=>false
      t.string "lastname",:limit=>100,:null=>false
      t.string "email",:limit=>150,:null=>false
      t.belongs_to :role
      t.belongs_to :group
      t.string "status",:limit=>1,:null=>true
      t.timestamps
    end
   end
end