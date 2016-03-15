class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
