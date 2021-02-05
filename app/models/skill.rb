class Skill < ApplicationRecord
  belongs_to :type
  
  validates :name, presence: true, length: { maximum: 255 }
  
  has_many :history_skills
  has_many :histories, through: :history_skills
end
