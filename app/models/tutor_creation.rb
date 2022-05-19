class TutorCreation < ApplicationRecord
  validates :first_name, :last_name, :description, :price, :subject, presence: true
  
  belongs_to :user
end
