class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.date :began_at
      t.date :ended_at
      t.string :company
      t.string :department
      t.text :detail
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
