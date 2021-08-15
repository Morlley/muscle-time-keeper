class AddPublicFunctionToRoutines < ActiveRecord::Migration[6.0]
  def change
    change_table :routines do |t|
      t.references :having_user, foreign_key: {to_table: :users}
      t.integer :status_id, null: false
    end
  end
end
