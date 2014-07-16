class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :category_id
      t.integer :created_by
      t.integer :department_id
      t.integer :priority_id
      t.integer :status_id
      t.integer :current_tech_id
      t.integer :application_id
      t.integer :requested_by
      t.string :short_description 
      t.datetime :assigned_on 
      t.datetime :completed_at
      t.timestamps
    end
  end
end
