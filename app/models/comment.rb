class Comment < ApplicationRecord
  belongs_to :tutor_creation
  belongs_to :user
end
