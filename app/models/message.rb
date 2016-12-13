class Message < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 150 }

  belongs_to :user

  scope :desc, -> { order(created_at: :desc) }
  scope :stream_for, -> (user) { where(user: [user] + user.following).desc }
end
