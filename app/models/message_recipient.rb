class MessageRecipient < ApplicationRecord
  belongs_to :user, foreign_key: true
  belongs_to :group, foreign_key: true
  belongs_to :message, foreign_key: true

end
