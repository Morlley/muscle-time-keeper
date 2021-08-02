class CreateRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :routines do |t|
      t.string :menu,           null: false
      t.integer :set_count_id,  null: false
      t.integer :rest_id,       null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
