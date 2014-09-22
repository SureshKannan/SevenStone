class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "firstname",:limit=>100,:null=>false
      t.string "lastname",:limit=>100,:null=>false
      t.string "email",:limit=>150,:null=>false
      t.references :role, :index =>true,:null=>true
      t.references :group, :index =>true,:null=>true
      t.string "status",:limit=>1,:null=>true
      t.timestamps
    end
  end
end
