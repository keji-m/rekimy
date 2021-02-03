class History < ApplicationRecord
  belongs_to :user
  
  validates :began_at, presence: true
  validates :company, presence: true, length: { maximum: 255 }
  validates :department, length: { maximum: 255 }
  
end
