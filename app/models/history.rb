class History < ApplicationRecord
  belongs_to :user
  
  validates :began_at, presence: true
  validates :company, presence: true, length: { maximum: 255 }
  validates :department, length: { maximum: 255 }
  
  has_many :history_skills, dependent: :destroy
  has_many :skills, through: :history_skills
  
end
