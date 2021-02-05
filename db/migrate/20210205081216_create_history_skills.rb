class CreateHistorySkills < ActiveRecord::Migration[5.2]
  def change
    create_table :history_skills do |t|
      t.references :history, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
      
      t.index [:history_id, :skill_id], unique: true
    end
  end
end
