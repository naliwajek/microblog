class User < ApplicationRecord
  validates :name, presence: true

  has_many :messages, dependent: :destroy
  has_many :active_relationships, class_name:  'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
end
