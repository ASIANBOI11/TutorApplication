class TutorCreation < ApplicationRecord
  validates :first_name, :last_name, :description, :price, :subject, presence: true
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo

end
