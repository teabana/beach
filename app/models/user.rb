class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :beachs
  has_many :beach_activitys
  has_many :beach_facilitys

  validates :nickname, presence: true

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                      message: 'is invalid. Input a mixture of single-byte alphanumeric characters.'}
end
