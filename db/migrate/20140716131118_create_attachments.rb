class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :path
      t.string :doctype
      t.integer :serialnum
      t.integer :ticket_id
      t.timestamps
    end
  end
end
