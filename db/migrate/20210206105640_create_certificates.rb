class CreateCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :certificates do |t|
      t.string :name
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
