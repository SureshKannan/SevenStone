class CreateTicketHistories < ActiveRecord::Migration
  def change
    create_table :ticket_histories do |t|
      t.integer :ticket_id
      t.integer :tech_id
      t.integer :status_id
      t.integer :priority_id
      t.string :comment
      t.datetime :assigned_on
      t.timestamps
    end
  end
end
