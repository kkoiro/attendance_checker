class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name, null: false, unique: true
      t.integer :classification_id, null: false
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end
