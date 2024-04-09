class Message < ApplicationRecord
  validates :content, presence: true, length: { in: 1..5000 }
  belongs_to :user
  has_many :message_recipients, dependent: :destroy

  has_many_attached :files, dependent: :destroy
end
