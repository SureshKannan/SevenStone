class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name,:limit=>100,:null=>false
      t.string :status,:limit=>1,:null=>true
      t.timestamps
    end
  end
end
