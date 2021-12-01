class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :label, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
