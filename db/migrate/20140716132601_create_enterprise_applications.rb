class CreateEnterpriseApplications < ActiveRecord::Migration
  def change
    create_table :enterprise_applications do |t|
      t.string :name
      t.timestamps
    end
  end
end
