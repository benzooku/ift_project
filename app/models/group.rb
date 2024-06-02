class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 4..100 }
  belongs_to :project, foreign_key: true
  has_many :message_recipients
  has_many :groupings, dependent: :destroy
end
