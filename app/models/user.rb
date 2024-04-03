class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable
  validates :name, :first_name, presence: true

  validates :password, presence: true, length: { in: 6..20 }

  has_many :workers, dependent: :destroy
  has_many :messages
  has_many :message_recipients

  has_many :groupings, through: :workers
  has_many :groups, through: :groupings
end
