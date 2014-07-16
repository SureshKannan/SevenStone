class CreateCategoryTeches < ActiveRecord::Migration
  def change
    create_table :category_teches do |t|
      t.integer :tech_id
      t.integer :category_id
      t.integer :category_role
      t.integer :order_id
      t.timestamps
    end
  end
end
