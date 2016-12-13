class Message < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 150 }

  belongs_to :user
end
