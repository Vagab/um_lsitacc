class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :public_key, presence: true

  has_many :user_chats
  has_many :chats, through: :user_chats
  has_many :messages

  def name
    [first_name, last_name].join(" ")
  end
end
