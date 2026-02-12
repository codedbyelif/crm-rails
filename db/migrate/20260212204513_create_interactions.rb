class CreateInteractions < ActiveRecord::Migration[8.1]
  def change
    create_table :interactions do |t|
      t.string :interaction_type
      t.datetime :occurred_at
      t.text :notes
      t.references :interactable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
