class CreateApplicationTeches < ActiveRecord::Migration
  def change
    create_table :application_teches do |t|
      t.integer :tech_id
      t.integer :application_id
      t.integer :application_role
      t.integer :order_id
      t.timestamps
    end
  end
end
