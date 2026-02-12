class CreateLeads < ActiveRecord::Migration[8.1]
  def change
    create_table :leads do |t|
      t.string :source
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
