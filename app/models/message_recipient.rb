class MessageRecipient < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :message
end
