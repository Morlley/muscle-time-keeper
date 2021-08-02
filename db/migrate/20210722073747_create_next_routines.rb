class CreateNextRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :next_routines do |t|
      t.string :menu,              null: false
      t.integer :set_count_id,     null: false
      t.integer :rest_id,          null: false
      t.references :routine,       foreign_key: true
      t.timestamps
    end
  end
end
