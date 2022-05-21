class Comment < ApplicationRecord
  belongs_to :tutor_creation
  belongs_to :user
  has_rich_text :body
end
